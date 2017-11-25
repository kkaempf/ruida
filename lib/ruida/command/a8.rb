module Ruida
  class Cmd_a8 < Cmd
    def self.format
      [ "a8", :abs, :abs ]
    end
  end
end
