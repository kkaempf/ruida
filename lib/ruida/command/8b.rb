module Ruida
  class Cmd_8b < Cmd
    def initialize data
      super data
      consume 2
    end
  end
end
