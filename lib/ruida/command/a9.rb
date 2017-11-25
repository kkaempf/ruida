module Ruida
  class Cmd_a9 < Cmd
    # kreis
    def initialize data
      super data
      consume 4
    end
  end
end
