module Ruida
  class Cmd_88 < Cmd
    def self.format
      ["Mov_Abs", :abs, :abs ]
    end
  end
end
