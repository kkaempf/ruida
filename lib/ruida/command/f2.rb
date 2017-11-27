module Ruida
  class Cmd_f2 < Cmd
    def self.format
      {
	0x00 => ["F2 00", -1 ],
	0x01 => ["F2 01", -1 ],
	0x02 => ["F2 02", -10 ],
	0x03 => ["F2 03", :abs, :abs ],
	0x04 => ["Bottom_Right_F2_04", :abs, :abs ],
	0x05 => ["Bottom_Right_F2_05", -4, :abs, :abs ],
	0x06 => ["F2 06", :abs, :abs ],
	0x07 => ["F2 07", -1 ]
      }
    end
  end
end
