module Ruida
  class Cmd_ab < Cmd
    def self.format
      [ "Distort_AB", :percent ]
    end
  end
end
