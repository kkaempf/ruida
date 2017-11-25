module Ruida
  class Cmd_c9 < Cmd
    def initialize data
      super data
      @sub = consume
      case @sub
      when 0x02
        consume 5
      else
        printf "C9 %02x", @sub
      end
    end
  end
end
