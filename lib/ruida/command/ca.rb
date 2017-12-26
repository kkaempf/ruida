module Ruida
  class Cmd_ca  < Cmd
    def flags
      f = consume
      case f
      when 0x12
        @name = "Blow_off"
      when 0x13
        @name = "Blow_on"
      else
        @args << ("%02x" % f)
      end
    end
    def self.format
      { 0x01 => [ "Flags_CA_01", "flags"],
        0x02 => [ "CA 02", :priority],
        0x03 => [ "CA_03", -1],
        0x06 => [ "Layer_Color", :layer, :color],
        0x10 => [ "CA 10", -1],
        0x22 => [ "Layer_Count", -1],
        0x41 => [ "Layer_CA_41", :layer, -1]
      }
    end
  end
end
