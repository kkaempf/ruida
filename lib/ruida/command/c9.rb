module Ruida
  class Cmd_c9 < Cmd
    def self.format
      {
	0x02 => ["C8 02", -5 ]
      }
    end
  end
end
