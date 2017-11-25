module Ruida
  class Cmd_a9 < Cmd
    def self.format
      [ "Cut_Rel", :rel, :rel ]
    end
  end
end
