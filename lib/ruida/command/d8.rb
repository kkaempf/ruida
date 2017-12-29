module Ruida
  class Cmd_d8 < Cmd
    def self.format
      {
        0x00 => ["Light_RED", 0x00],
        0x12 => ["UploadFollows"],
      }
    end
  end
end
