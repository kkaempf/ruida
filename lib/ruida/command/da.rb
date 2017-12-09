module Ruida
  class Cmd_da < Cmd
    def self.format
      [ "Work_Interval", -3, :meter, :meter ]
    end
  end
end
