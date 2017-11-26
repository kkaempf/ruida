module Ruida
  class Cmd_da < Cmd
    def self.format
      [ "DA", -3, :abs, :abs ]
    end
  end
end
