module Ruida
  class Cmd_aa < Cmd
    def self.format
      [ "Distort_AA", :percent ]
    end
  end
end
