module Ruida
  class Cmd_a8 < Cmd
    def self.format
      [ "Cut_Abs_a8", :abs, :abs ]
    end
  end
end
