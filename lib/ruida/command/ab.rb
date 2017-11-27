module Ruida
  class Cmd_ab < Cmd
    def self.format
      [ "Cut_Vert", :rel ]
    end
  end
end
