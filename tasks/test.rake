$:.push(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruida'

task :test do
  rd_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'rd'))
  Dir.open(rd_dir).each do |path|
    next unless path =~ /.*\.rd$/
    puts path
    file = File.open(File.join(rd_dir,path), 'r')
    file.binmode
    rd = Ruida::Data.new file.read
    begin
      parser = Ruida::Parser.new rd
      parser.each do |c|
      end
    rescue Exception => e
      STDERR.puts e
    end
  end
end
