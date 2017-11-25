module Ruida
  class Cmd_88 < Cmd
    def self.format
      ["Point_88", :abs, :abs ]
    end
  end
end
