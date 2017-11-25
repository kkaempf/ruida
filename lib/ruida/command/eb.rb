module Ruida
  class Cmd_eb < Cmd
    def initialize data
      super data
      consume 2
    end
  end
end
