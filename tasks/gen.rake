$:.push(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruida'

#
# generate test results in ../rd
#
task :gen do
  rd_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'rd'))
  Dir.open(rd_dir).each do |path|
    next unless path =~ /(.*)\.rd$/
    name = $1
    puts name
    inp = File.open(File.join(rd_dir,path), 'r')
    out = File.open(File.join(rd_dir,"#{name}.decode"), 'w+')
    inp.binmode
    out.binmode
    rd = Ruida::Data.new inp.read
    begin
      parser = Ruida::Parser.new rd
      parser.each do |c|
        out.puts c
      end
    rescue Exception => e
      STDERR.puts e
    end
    out.close
    inp.close
  end
end
