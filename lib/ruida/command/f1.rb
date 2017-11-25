module Ruida
  class Cmd_f1 < Cmd
    def self.format
      {
	0x00 => ["F1 00", -1 ],
	0x01 => ["F1 01", -1 ],
	0x02 => ["F1 02", -1 ],
	0x03 => ["F1 03", -10 ]
      }
    end
  end
end
