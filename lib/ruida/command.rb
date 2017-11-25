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
        cmd = klass.new data if klass
        cmd.interprete
        cmd
      rescue LoadError
        puts "Unknown #{hex} @ #{data.pos}"
      end
    end
  end
end
