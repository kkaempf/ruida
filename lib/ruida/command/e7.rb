module Ruida
  class Cmd_e7 < Cmd
    def initialize data
      super data
      @sub = consume
      case @sub
      when 0x00
      when 0x03, 0x06, 0x07, 0x50, 0x51
        consume 10
      when 0x04, 0x08
        consume 14
      when 0x05
        consume 9
      when 0x13, 0x17, 0x23
        consume 10
      when 0x52, 0x53, 0x61, 0x62
        consume 11
      when 0x54, 0x55
        consume 6
      when 0x24, 0x60
        consume 1
      else
        printf "E7 %02x\n", @sub
      end
    end
  end
end
