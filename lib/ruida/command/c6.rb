module Ruida
  class Cmd_c6 < Cmd
    def self.format
      { 0x01 => ["Laser_1_Min_Pow_C6_01", :power],
        0x02 => ["Laser_1_Max_Pow_C6_02", :power],
        0x05 => ["Laser_3_Min_Pow_C6_05", :power],
        0x06 => ["Laser_3_Max_Pow_C6_06", :power],
        0x07 => ["Laser_4_Min_Pow_C6_07", :power],
        0x08 => ["Laser_4_Max_Pow_C6_08", :power],
        0x10 => ["Dot time", :sec],
        0x12 => ["Cut_Open_delay_12", :ms],
        0x13 => ["Cut_Close_delay_13", :ms],
        0x15 => ["Cut_Open_delay_15", :ms],
        0x16 => ["Cut_Close_delay_16", :ms],
        0x21 => ["Laser_2_Min_Pow_C6_21", :power],
        0x22 => ["Laser_2_Max_Pow_C6_22", :power],
        0x31 => ["Laser_1_Min_Pow_C6_31", :layer, :power],
        0x32 => ["Laser_1_Max_Pow_C6_32", :layer, :power],
        0x35 => ["Laser_3_Min_Pow_C6_35", :layer, :power], # 654XG only
        0x36 => ["Laser_3_Max_Pow_C6_36", :layer, :power], # 654XG only
        0x37 => ["Laser_4_Min_Pow_C6_37", :layer, :power], # 654XG only
        0x38 => ["Laser_4_Max_Pow_C6_38", :layer, :power], # 654XG only
        0x41 => ["Laser_2_Min_Pow_C6_41", :layer, :power],
        0x42 => ["Laser_2_Max_Pow_C6_42", :layer, :power],
        0x50 => ["Cut_through_power1", :power],
        0x51 => ["Cut_through_power2", :power],
        0x55 => ["Cut_through_power3", :power],
        0x56 => ["Cut_through_power4", :power]
    }
    end
  end
end
