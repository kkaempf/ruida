module Ruida
  class Cmd_d8 < Cmd
    def self.format
      ["Light_RED", 0x00]
    end
  end
end
