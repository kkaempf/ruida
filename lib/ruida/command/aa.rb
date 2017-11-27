module Ruida
  class Cmd_aa < Cmd
    def self.format
      [ "Cut_Horiz", :rel ]
    end
  end
end
