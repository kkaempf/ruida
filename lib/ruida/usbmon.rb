# Convert USBMON capture data ('u' format) to ASCII
#

      # U                T          E A          S
      # ffff88030b7da180 3003266721 S Co:1:002:0 s 40 0c 0087 0008 0001 1 = 04
      # U - urb tag
      # T - timestamp
      # E - event type ('S'ubmission, 'C'allback, 'E'error)
      # A - address word (formerly 'pipe')
      #                <URB type and direction>:<Bus number>:<Device address>:<Endpoint number>
      #	               Ci Co   Control input and output
      #                Zi Zo   Isochronous input and output
      #		       Ii Io   Interrupt input and output			    
      #                Bi Bo   Bulk input and output
      # S - status     ('s' - setup tag)
      #

module UsbMon
  
  class EventIterator
    attr_reader :lnum
    def initialize input
      @input = input
      @peek = nil
      @lnum = 0
    end
    # get next event without consuming it
    def peek klass = nil, utd = nil
      begin
        @peek = self.next klass, utd
      rescue
      end
      @peek
    end
    # consume next event
    def next klass = nil, utd = nil
      if @peek
        event = @peek
        @peek = nil
      else
        line = nil
        while (line = @input.gets)
          @lnum += 1
          line.strip!
          next if line.empty?
          next if line[0,1] == '#' # comment
          break
        end
        raise IOError unless line # EOF
        event = Event.line_parse line
      end
      if klass
        raise "Event #{event.class} does not match #{klass}" unless event.is_a? klass
        if utd
          raise "Event #{event.utd} does not match #{utd}" unless event.utd == utd
        end
      end
      event
    end
  end

  #
  # Core class - USB Event
  #
  # This class is never directly instantiated, instead
  # its #parse method is used to create Event-specific subclasses
  # such as Callback, Submission or Error
  #
  class Event
    private
    #
    # (private)
    # parse 'address word'
    #
    def address word
      # A - address word (<URB type and direction>:<Bus number>:<Device address>:<Endpoint number>)
      values = word.split(":")
      @utd = values[0]
      @bus = values[1].to_i
      @device = values[2].to_i
      @endpoint = values[3].to_i
    end
    #
    # (private)
    # Initialize Event
    #
    # Consumes 5 values
    #
    def initialize values
      @raw = values.join(" ")
      @urb = values.shift.hex
      @timestamp = values.shift.to_i
      values.shift # values[2] consumed at parse
      address values.shift
      @status = values.shift
    end
    public
    attr_reader :raw, :urb, :timestamp, :utd, :bus, :device, :endpoint, :status, :dlen, :dtag, :data
    #
    # Check for payload equality
    #
    def == event
      self.utd == event.utd &&
        self.bus == event.bus &&
        self.device == event.device &&
        self.endpoint == event.endpoint &&
        self.dlen == event.dlen &&
        self.dtag == event.dtag &&
        self.data == event.data
    end
    #
    # parse data
    #
    # Consumes all values
    #
    def data= values
      return unless values
#      puts "data #{values.inspect}"
      @dlen = values.shift.to_i
      return unless @dlen
      @dtag = values.shift
      if @dtag == "="
	@data = values.join("")
      end
    end
    def data_s
      s = ""
      if @data
	ascii = ""
	@data.scan(/../).collect do |v|
	  val = v.hex
	  if val < 32 || val > 126
	    ascii << "."
	  else
	    ascii << val.chr
	  end
	  s << " #{v}"
	end
	s << " | " << ascii
      end
      s
    end
    public
    def Event.line_parse line
      values = line.split(" ")
      # <urb> <time> <type> ...
      case values[2]
      when 'S' then return Submission.new values
      when 'C' then return Callback.new values
      when 'E' then return Error.new values
      else
	STDERR.puts "Unknown event type >#{values[2]}"
      end
    end
    #
    # Parse usbmon line or file, return single (line) or Array (file) of events
    # Create correct Instance
    #
    def Event.parse input
      case input
      when IO
        out = []
        while (line = input.gets)
          line.strip!
          next if line.empty?
          next if line[0,1] == '#' # comment
          out << line_parse(line)
        end
      else
        out = line_parse input
      end
      out
    end
    #
    # string representation
    #
    def to_s
      "%016x %08d %s [B%dD%dE%d]" % [@urb, @timestamp, @utd, @bus, @device, @endpoint]
    end
    #
    # content to string
    #
    def content
      "%s [B%dD%dE%d]" % [@utd, @bus, @device, @endpoint]
    end
  end
  
  #
  # Submission event
  #
  class Submission < Event
    private
    def request_type_s
      s = case (@bmRequestType >> 5) & 0x03
      when 0 then "Standard"
      when 1 then "Class"
      when 2 then "Vendor"
      when 3 then "Reserved"
      end
      s << " "
      s << (((@bmRequestType & 128) == 0) ? "->" : "<-")
      s << case @bmRequestType & 0x1f
      when 0 then "Device"
      when 1 then "Interface"
      when 2 then "Endpoint"
      when 3 then "Other"
      else
	"Reserved"
      end
    end
    public
    attr_reader :bmRequestType, :bRequest, :wValue, :wIndex, :wLength, :dtag, :data
    def initialize values
      super values
      if @status == "s" # setup
	@bmRequestType = values.shift.hex
	@bRequest = values.shift.hex
	@wValue = values.shift.hex
	@wIndex = values.shift.hex
	@wIndex = -(65536-@wIndex) if @wIndex > 32767
	@wLength = values.shift.hex
	self.data = values
      else
	status = @status.split ":"
	if status.size > 1
	  STDERR.puts "Status #{@status}"
	else
	  @status = @status.to_i
	end
      end
    end
    def to_s
      s = "#{super} S"
      if @status == "s"
	s << " {setup: %s r %x val %04x idx %04x len %d} " % [ request_type_s, @bRequest, @wValue, @wIndex, @wLength ]
	s << data_s
      end
      s
    end
  end

  #
  # Callback event
  #
  class Callback < Event
    def initialize values
      super values
      self.data = values
    end
    def to_s
      s = "#{super} C"
      s << data_s
    end
  end

  #
  # Error event
  #
  class Error < Event
    def initialize values
      super values
    end
    def to_s
      s = "#{super} E"
    end
  end

end # module
