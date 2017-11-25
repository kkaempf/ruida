module Ruida
  class Cmd_a8 < Cmd
    def initialize data
      super data
      consume 10
    end
  end
end
