module Ruida
  class Command
    require "ruida/command/cmd"
    def self.consume data
      cmd = data.consume
      return nil unless cmd
      hex = sprintf "%02x", cmd
      begin
        require "ruida/command/"+hex
        klass = Ruida::const_get "Cmd_"+hex
        c = klass.new data if klass
        klass
      rescue LoadError
        puts "Unknown #{hex} @ #{data.pos}"
      end
    end
  end
end
