module Ruida
  class Cmd_89 < Cmd
    def self.format
      [ "Move_To_Rel", :rel, :rel ]
    end
  end
end
