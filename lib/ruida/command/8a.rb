module Ruida
  class Cmd_8a < Cmd
    def self.format
      [ "Move_Horiz", :rel ]
    end
  end
end
