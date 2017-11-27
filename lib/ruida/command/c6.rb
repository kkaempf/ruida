module Ruida
  class Cmd_c6 < Cmd
    def self.format
      { 0x01 => ["Laser_1_Min_Pow_C6_01", :power],
        0x02 => ["Laser_1_Max_Pow_C6_02", :power],
        0x05 => ["C6 05", :power],
        0x06 => ["C6 06", :power],
        0x07 => ["C6 07", :power],
        0x08 => ["C6 08", :power],
        0x10 => ["C6 10", :abs],
        0x12 => ["C6 12", :abs],
        0x13 => ["C6 13", :abs],
        0x15 => ["C6 15", :abs],
        0x16 => ["C6 16", :abs],
        0x21 => ["Laser_2_Min_Pow_C6_21", :power],
        0x22 => ["Laser_2_Max_Pow_C6_22", :power],
        0x31 => ["Laser_1_Min_Pow_C6_31", :layer, :power],
        0x32 => ["Laser_1_Max_Pow_C6_32", :layer, :power],
        0x35 => ["C6 35", :layer, :power],
        0x36 => ["C6 36", :layer, :power],
        0x37 => ["C6 37", :layer, :power],
        0x38 => ["C6 38", :layer, :power],
        0x41 => ["Laser_2_Min_Pow_C6_41", :layer, :power],
        0x42 => ["Laser_2_Max_Pow_C6_42", :layer, :power],
        0x50 => ["C6 50", -2],
        0x51 => ["C6 51", -2],
        0x55 => ["C6 55", -2],
        0x56 => ["C6 56", -2]
    }
    end
  end
end
