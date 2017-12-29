module Ruida
  class Cmd_e8 < Cmd
    def self.format
      {
	0x01 => ["FileStore", 0x00, :number, :string ],
        0x02 => ["PrepFilename"],
      }
    end
  end
end
