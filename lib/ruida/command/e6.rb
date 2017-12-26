module Ruida
  class Cmd_e6 < Cmd
    def self.format
      [ "E601", 0x01 ]
    end
  end
end
