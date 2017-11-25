module Ruida
  class Cmd
    # interprete format description
    # [ "Name", <item>, <item>, ... ]
    # <item> : Integer, > 0 - consume constant
    #          Integer, < 0 - consume -<item> bytes
    #          :abs - consume absolute coordinate
    #
    def interprete
      format = begin
        self.class.format
      rescue NameError
        puts "#{self.class.name} has no format descriptor"
        return
      end
#      puts "format #{format.class}:#{format.inspect}"
      case format
      when Array
#        puts "interprete #{format.class}:#{format.inspect}"
        # fallthru
      when Hash
        sub = consume
        format = format[sub]
        STDERR.printf "#{self.class.name}:%02x ?\n", sub unless format
      when nil
      else
        STDERR.printf "Unknown format value #{format.inspect}"
        raise
      end
      @name = format.shift
      loop do
        break if format.empty?
        f = format.shift
#        puts "interprete item #{f.inspect}"
        case f
        when Integer
          if f >= -1
            v = consume
            if f >= 0 && v != f
              STDERR.printf "#{self.class}: expected %02x, got %02x", f, v
            end
            @args << "%02x" % v
          else
            consume(-f).each do |v|
              @args << "%02x" % v
            end
          end
        when :abs
          @args << abscoord
        else
          STDERR.puts "Can't interprete #{f.inspect}"
        end
      end
    end
    def initialize data
      @data = data
      @args = []
    end
    def to_s
      s = @name || self.class.name
      @args.each do |a|
        s << " #{a}"
      end
      s
    end
    # consume bytes from data
    def consume n=1
      @data.consume n
    end
    # power in 0,006103516% (100/2^14)
    def power
      p = consume 2
    end
    # absolute position relative to job origin in µm
    def abscoord
      pos = 0
      5.times do |_|
        pos <<= 8
        pos += consume
      end
      pos.to_f
    end
    # relative position in µm; signed (2s complement)
    def relcoord
      r = consume 2
    end
    # speed in µm/s
    def speed
      s = consume 5
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
