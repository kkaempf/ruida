module Ruida
  class Cmd_f2 < Cmd
    def initialize data
      super data
      @sub = consume
      case @sub
      when 0x02, 0x03, 0x04, 0x06
        consume 10
      when 0x00, 0x01, 0x07
        consume 1
      when 0x05
        consume 16
      else
        printf "F2 %02x", @sub
      end
    end
  end
end
