module Ruida
  class Cmd_88 < Cmd
    def self.format
      ["Move_To_Abs", :abs, :abs ]
    end
  end
end
