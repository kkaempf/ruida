module Ruida
  class Cmd_8b < Cmd
    def self.format
      [ "Move_Vert", :rel ]
    end
  end
end
