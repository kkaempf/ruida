module Ruida
  class Cmd_ca  < Cmd
    def initialize data
      super data
      @sub = consume
      case @sub
      when 0x01, 0x02, 0x03
        consume 1
      when 0x10
        consume 1
      when 0x06
        consume 6
      when 0x10
        consume 1
      when 0x22
        consume 1
      when 0x41
        consume 2
      else
        printf "CA %02x", @sub
      end
    end
  end
end
