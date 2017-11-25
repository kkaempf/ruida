module Ruida
  class Cmd_88 < Cmd
    def initialize data
      super data
      consume 10
    end
  end
end
