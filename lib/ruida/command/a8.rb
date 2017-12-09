module Ruida
  class Cmd_a8 < Cmd
    def self.format
      [ "Cut_Abs", :abs, :abs ]
    end
  end
end
