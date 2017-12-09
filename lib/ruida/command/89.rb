module Ruida
  class Cmd_89 < Cmd
    def self.format
      [ "Mov_Rel", :rel, :rel ]
    end
  end
end
