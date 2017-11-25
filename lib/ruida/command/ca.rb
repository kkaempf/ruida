module Ruida
  class Cmd_ca  < Cmd
    def self.format
      { 0x01 => [ "CA 01", -1],
        0x02 => [ "CA 02", -1],
        0x03 => [ "CA 03", -1],
        0x06 => [ "CA 06", -6],
        0x10 => [ "CA 10", -1],
        0x22 => [ "CA 22", -1],
        0x41 => [ "CA 41", -2]
      }
    end
  end
end
