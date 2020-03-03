module Ruida
  class Cmd
    attr_reader :pos, :length
    def error msg
      pos = " @ %05x" % @data.pos
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
      sub = nil
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
              subhex = (sub.nil?) ? "" : ("%02x"%sub)
              STDERR.printf "%05x: #{self.class}#{subhex}#{@args.inspect}: expected %02x, got %02x\n", @data.pos, f, v
              exit 1
            end
            @args << "%02x" % v
          else
            consume(-f).each do |v|
              @args << "%02x" % v
            end
          end
        when :abs
          @args << "#{abscoord.round(3)}mm"
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
        when :sec
          @args << "#{sec} s"
        when :percent
          @args << "#{percent}%"
        when :bool
          @args << "#{bool}"
        when :freq
          @args << "#{freq}kHz"
        when :laser
          @args << "Laser#{consume+1}"
        when :meter
          @args << "#{(abscoord*1000).round(3)}mm"
        when :color
          @args << "#{color}"
        when :priority
          @args << "Prio #{consume}"
        when :string
          @args << " #{cstring.inspect}"
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
      (7-(s.size / 8)).times do
        s << "\t"
      end
      for i in @pos...@pos+@length do
        s << "%02x " % @data[i]
      end
      s
    end
    # consume bytes from data
    def consume n=1
      @data.values n
    end
    def peek
      @data.peek
    end
    def raw
      @data.raw(@pos, @length)
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
    # percent in 0,006103516% (100/2^14) , 2^14 == 16384
    def percent
      p = (number(2).to_f * 0.006103516).round
      if p > 100
        error "Not percent: #{p}"
      end
      p
    end
    # number of n hex values
    def number n
      fak = 1
      res = 0
      xor = (n > 2) ? peek : 0
      consume(n).reverse.each do |b|
        b ^= xor
        res += fak * b
#        printf "fak %02x b %02x res %f\n", fak, b, res if n == 2
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
      res = number(2)
      if res > 8191
        res = res-16384
      end
      res.to_f / 1000.0
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
    # dot time in s
    def sec
      number(5).to_f / 1000.0 / 1000.0
    end
    # Laser frequency
    def freq
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
      s
    end
    # 0..255 -> 0..100
    def normalize_color c
      c * 0.392156863; # * 100/255
    end
    # color, BGR, each value 8bits, distributed over 7-bit value
    def color
      rgb = consume(5).reverse
      red = rgb[0] + ((rgb[1] & 0x01) << 7) # red overflows by 1 bit
      green = ((rgb[1] & 0x7e) >> 1) + ((rgb[2] & 0x03) << 6) # green by 2 bits
      blue = ((rgb[2] & 0x7c) >> 2) + ((rgb[3] & 0x07) << 5) # blue by 3 bits
      "R %d%%, G %d%%, B %d%%" % [normalize_color(red), normalize_color(green), normalize_color(blue)]
    end
  end
end
