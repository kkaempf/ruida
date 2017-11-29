module Ruida
  class Cmd_f1 < Cmd
    def self.format
      {
	0x00 => ["Start0", 0x00 ],
	0x01 => ["Start1", 0x00 ],
	0x02 => ["Start2", 0x00 ],
	0x03 => ["Laser2_Offset", :abs, :abs ],
	0x04 => ["Enable_Feeding(auto?)", :bool ]
      }
    end
  end
end
