module Ruida
  class Cmd_f1 < Cmd
    def initialize data
      super data
      @sub = consume
      case @sub
      when 0x00, 0x01, 0x02
        consume
      when 0x03
        consume 10
      else
        printf "F1 %02x", @sub
      end
    end
  end
end
