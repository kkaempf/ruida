module Ruida
  class Data
    private
    # unscramble single byte
    def unscramble b
      #    printf "unscramble %02x magic %02x\n", b, @@magic
      res_b = (b == 0) ? 0xff : b-1
      res_b ^= @@magic
      fb = res_b & 0x80
      lb = res_b & 1
      res_b = res_b - fb - lb
      res_b |= lb << 7
      res_b |= fb >> 7
      res_b
    end
    # check initial bytes of RD file
    def recognize raw
      checksum = raw[0,1].ord << 8
      checksum += raw[1,1].ord
      @filetype = raw[2,1].ord
      # D2 9B FA
      @@magic = case @filetype
    when 0xfa # Model 320, 633x, 644xg, 644xs, 654xs
        0x88
      when 0x61 # Model 634xg
        0x11
      else
        raise "Not a RD file: expecting 0xfa, got 0x%02x" % @filetype
      end
      checksum
    end
    public
    attr_reader :pos
    def initialize raw
      checksum = recognize raw
      sum = 0
      # split buffer to array of numbers
      @data = raw[3..-1].split("").map do |c|
        v = c.ord
        sum += v
        unscramble(v)
      end
      printf "File checksum %04x, computed %04x\n", checksum, sum
      rewind
      @size = @data.size
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
        v = consume
        break unless v
        block.call v
      end
      rewind
    end
    # rewind to after header
    def rewind
      @pos = 3
      @eof = false
    end
    # consume n bytes from data
    # returns Integer if n = 1
    # else returns Array
    def consume n=1
      if @pos + n > @size
        return nil
      end
      v = @data[@pos, n]
      @pos += n
      (n == 1) ? v[0] : v
    end
    # peek one byte without incrementing @pos
    def peek
      @data[@pos]
    end
  end
end
