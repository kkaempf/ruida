module Ruida
  class Cmd_da < Cmd
    def self.format
      [ "Sew_Comp_Half", -3, :abs, :abs ]
    end
  end
end
