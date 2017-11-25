module Ruida
  class Cmd_89 < Cmd
    def initialize data
      super data
      consume 4
    end
  end
end
