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
        STDERR.printf "*** Unknown #{hex} @ 0x%05x\n" % data.pos
        exit 1
      end
    end
  end
end
