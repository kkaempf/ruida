module Ruida
  class Cmd_d8 < Cmd
    def self.format
      ["Start", 0x00]
    end
  end
end
