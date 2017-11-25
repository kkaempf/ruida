module Ruida
  class Cmd
    def initialize data
      @data = data
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
      c = consume 5
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
