module Ruida
  class Parser
    def initialize data
      @data = data
    end
    def each(&block)
      loop do
        cmd = Command.consume @data
        break unless cmd
        block.call cmd
      end
    end
  end
end
