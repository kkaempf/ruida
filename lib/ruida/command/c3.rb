module Ruida
  class Cmd_c3 < Cmd
    def initialize data
      super data
      consume 2
    end
  end
end
