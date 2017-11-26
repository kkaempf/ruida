module Ruida
  class Cmd_06 < Cmd
    # 320, 633X only
    def self.format
      ["06", :abs, :abs ]
    end
  end
end
