module Ruida
  class Cmd_c0 < Cmd
    def initialize data
      super data
      consume 2
    end
  end
end
