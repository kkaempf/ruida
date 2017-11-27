module Ruida
  class Cmd_e7 < Cmd
    def self.format
      { 0x00 => ["E7 00"],
        0x03 => ["Top_Left_E7_07", :abs, :abs],
        0x04 => ["E7 04", -9, :abs],
        0x05 => ["Speed_E7_05", -4, :speed],
        0x06 => ["E7 06", :abs, :abs],
        0x07 => ["Bottom_Right_E7_07", :abs, :abs],
        0x08 => ["E7 08", -9, :abs],
        0x13 => ["E7 13", :abs, :abs],
        0x17 => ["Point_E7_17", :abs, :abs],
        0x23 => ["E7 23", :abs, :abs],
        0x24 => ["E7 24", -1],
        0x50 => ["Top_Left_E7_50", :abs, :abs],
        0x51 => ["Bottom_Right_E7_51", :abs, :abs],
        0x52 => ["E7 52", 0x00, :abs, :abs],
        0x53 => ["Point_E7_53", 0x00, :abs, :abs],
        0x54 => ["E7 54", -1, :abs],
        0x55 => ["E7 55", -1, :abs],
        0x60 => ["E7 60", -1],
        0x61 => ["E7 61", 0x00, :abs, :abs],
        0x62 => ["Point_E7_62", 0x00, :abs, :abs]
      }
    end
  end
end
