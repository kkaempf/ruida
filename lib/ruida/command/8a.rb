module Ruida
  class Cmd_8a < Cmd
    def initialize data
      super data
      consume 2
    end
  end
end
