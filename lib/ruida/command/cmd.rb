module Ruida
  class Cmd
    def error msg
      pos = " @ %05x" % data.pos
      STDERR.puts msg+pos
      exit 1
    end
    # interprete format description
    # [ "Name", <item>, <item>, ... ]
    # <item> : Integer, > 0 - consume constant
    #          Integer, < 0 - consume -<item> bytes
    #          :abs - consume absolute coordinate
    #
    def interprete
      format = self.class.format
#      puts "format #{format.class}:#{format.inspect}"
      case format
      when Array
#        puts "interprete #{format.class}:#{format.inspect}"
        # fallthru
      when Hash
        sub = consume
        format = format[sub]
        unless format
          error "Undefined #{self.class.name}:%02x" % sub
        end
      when nil
      else
        error "Unknown format value #{format.inspect}"
      end
      @name = format.shift
      loop do
        break if format.empty?
        f = format.shift
#        puts "interprete item #{f.inspect}"
        case f
        when String
          self.send f.to_sym
        when Integer
          if f >= -1
            v = consume
            if f >= 0 && v != f
              STDERR.printf "%05x: #{self.class}#{@args.inspect}: expected %02x, got %02x\n", @data.pos, f, v
              exit 1
            end
            @args << "%02x" % v
          else
            consume(-f).each do |v|
              @args << "%02x" % v
            end
          end
        when :abs
          @args << "#{abscoord}mm"
        when :rel
          @args << "#{relcoord}mm"
        when :speed
          @args << "#{speed}mm/s"
        when :power
          @args << "#{percent}%"
        when :layer
          @args << "Layer:#{layer}"
        when :ms
          @args << "#{ms} ms"
        when :percent
          @args << "#{percent}%"
        when :bool
          @args << "#{bool}"
        else
          error "Can't interprete #{f.inspect}"
        end
      end
      @length = @data.pos - @pos
    end
    def initialize data
      @pos = data.pos - 1
      @data = data
      @args = []
    end
    def to_s
      s = ""
      s << (@name || self.class.name)
      @args.each do |a|
        s << " #{a}"
      end
      (6-(s.size / 8)).times do
        s << "\t"
      end
      for i in @pos...@pos+@length do
        s << "%02x " % @data[i]
      end
      s
    end
    # consume bytes from data
    def consume n=1
      @data.consume n
    end
    def bool
      case consume
      when 0
        "False"
      when 1
        "True"
      else
        raise "Not a bool"
      end
    end
    # percent in 0,006103516% (100/2^14)
    def percent
      p = (number(2).to_f * (100.0/(2 ** 14))).round
      if p > 100
        error "Not percent: #{p}"
      end
      p
    end
    # number of n hex values
    def number n
      fak = 1
      res = 0
      consume(n).reverse.each do |b|
        res += fak * b
        fak *= 0x80
      end
      res
    end
    # absolute position relative to job origin in mm
    def abscoord
      number(5).to_f / 1000.0
    end
    # relative position in µm; signed (2s complement)
    def relcoord
      r = consume << 8
      r += consume
      if r > 32767 || r < 0
        error "Not a rel coord"
      end
      ((r > 16384) ? r-32768 : r) / 1000.0
    end
    # speed in m/s
    def speed
      number(5).to_f / 1000.0
    end
    # layer
    def layer
      consume(1)
    end
    # delay in ms
    def ms
      number(5).to_f / 1000.0
    end      
    # zero terminated string
    def cstring
      s = ""
      loop do
        v = consume
        break if v == 0
        s += v.chr
      end
    end
  end
end
