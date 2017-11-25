module Ruida
  class Cmd_c6 < Cmd
    def initialize data
      super data
      @sub = consume
      case @sub
      when 0x01, 0x02
        consume 2
      when 0x05, 0x06, 0x07, 0x08
        consume 2
      when 0x10
        consume 5
      when 0x12, 0x13
        consume 5
      when 0x15, 0x16
        consume 5
      when 0x21, 0x22
        consume 2
      when 0x31, 0x32
        consume 3
      when 0x35, 0x36, 0x37, 0x38
        consume 3
      when 0x41, 0x42
        consume 3
      else
        printf "C6 %02x @ %d", @sub, data.pos
      end
    end
  end
end
