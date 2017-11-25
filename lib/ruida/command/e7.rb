module Ruida
  class Cmd_e7 < Cmd
    def self.format
      { 0x00 => ["E7 00"],
        0x03 => ["E7 03", :abs, :abs],
        0x04 => ["E7 04", -14],
        0x05 => ["Speed_E7_05", -4, :speed],
        0x06 => ["E7 06", :abs, :abs],
        0x07 => ["E7 07", :abs, :abs],
        0x08 => ["E7 08", -14],
        0x13 => ["E7 13", :abs, :abs],
        0x17 => ["Point_E7_17", :abs, :abs],
        0x23 => ["E7 23", :abs, :abs],
        0x24 => ["E7 24", -1],
        0x50 => ["E7 50", :abs, :abs],
        0x51 => ["E7 51", :abs, :abs],
        0x52 => ["E7 52", -11],
        0x53 => ["Point_E7_53", 0x00, :abs, :abs],
        0x54 => ["E7 54", -6],
        0x55 => ["E7 55", -6],
        0x60 => ["E7 60", -1],
        0x61 => ["E7 61", -11],
        0x62 => ["Point_E7_62", 0x00, :abs, :abs]
      }
    end
  end
end