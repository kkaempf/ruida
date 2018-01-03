module Ruida
  class Data
    private
    # unscramble single byte
    def unscramble b
      #    printf "unscramble %02x magic %02x\n", b, @@magic
      res_b = (b == 0) ? 0xff : b-1
      res_b ^= @magic
      fb = res_b & 0x80
      lb = res_b & 1
      res_b = res_b - fb - lb
      res_b |= lb << 7
      res_b |= fb >> 7
      res_b
    end
    # check initial bytes of RD file
    def recognize
      @filetype = @raw[0,3].split("").map { |c| c.ord }
      @magic = case @filetype[2]
      when 0xfa # Model 320, 633x, 644xg, 644xs, 654xs: D2 9B FA
        0x88
      when 0x61 # Model 634xg: 49 04 61
        0x11
      else
        STDERR.puts "*** Unknown model: %02x %02x %02x" % [@filetype[0],@filetype[1],@filetype[2]]
        nil
      end
    end
    public
    attr_reader :pos
    def initialize arg, magic = nil
      @magic = magic
      case arg
      when Integer # for lookuptable generation
        @magic = arg
      when NilClass
        STDERR.puts "Nil arg in call to Data.new"
      else
        @raw = arg
        if @magic
          @startpos = 0
        else
          @startpos = 3
          # recognize only if magic not known
          raise unless recognize
        end
        sum = 0
        # split buffer to array of numbers
        @data = @raw.split("").map do |c|
          v = c.ord
          sum += v
          unscramble(v)
        end
        rewind
        @size = @data.size
      end
    end
    # return hash with lookuptable
    def lookuptable
      res = Hash.new
      (0..255).each do |c|
        res[c] = unscramble(c)
      end
      res
    end
    def to_s
      "RD #{@size} bytes"
    end
    # getter
    def [] pos
      @data[pos]
    end
    # Enumerator
    def each(&block)
      loop do
        v = consume 1, :any
        break unless v
        block.call v
      end
      rewind
    end
    # rewind to after header
    def rewind
      @pos = @startpos
      @eof = false
    end
    # consume n bytes from data
    # returns Integer if n = 1
    # as_command: true:  assume byte is command - has high bit set
    #             false: assume bytes are data - have high bit clear
    # else returns Array
    def consume n=1, as=:data
      if @pos + n > @size
        return nil
      end
      v = @data[@pos, n]
      @pos += n
      case as
      when :data
        # assume data - high bit must be clear
        v.each do |vv|
          if vv > 127
            STDERR.puts "*** Data 0x%02x" % vv
          end
        end
      when :command
        # command - high bit must be set
        c = v[0]
        if c < 128
          raise "Command 0x%02x" % c
        end
        n = 1
      when :any
      else
        raise "Unknown consume mode #{as.inspect}"
      end
      (n == 1) ? v[0] : v
    end
    # consume 1 byte as command
    def command
      consume 1, :command
    end
    # consume n bytes as values
    def values n=1
      consume n, :data
    end
    # peek one byte without incrementing @pos
    def peek
      @data[@pos]
    end
    def raw start, len
      @raw[start,len]
    end
  end
end
