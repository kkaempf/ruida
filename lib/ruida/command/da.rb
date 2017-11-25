module Ruida
  class Cmd_da < Cmd
    def initialize data
      super data
      consume 13
    end
  end
end
