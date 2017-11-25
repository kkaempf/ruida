module Ruida
  class Cmd_d8 < Cmd
    def initialize data
      super data
      consume 1
    end
  end
end
