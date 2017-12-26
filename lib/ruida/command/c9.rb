module Ruida
  class Cmd_c9 < Cmd
    def self.format
      {
	0x02 => ["Speed_C9", :speed ],
        0x04 => ["Layer_Speed", :layer, :speed ]
      }
    end
  end
end
