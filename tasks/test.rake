$:.push(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruida'

task :test do
  rd_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'rd'))
  Dir.open(rd_dir).each do |path|
    next unless path =~ /(.*)\.rd$/
    name = $1
    puts path
    file = File.open(File.join(rd_dir,path), 'r')
    file.binmode
    decoded = []
    File.foreach(File.join(rd_dir,"#{name}.decode")) do |line|
      decoded << line.chomp
    end
    rd = Ruida::Data.new file.read
    lnum = 0
    begin
      parser = Ruida::Parser.new rd
      parser.each do |c|
        expected = decoded[lnum]
        lnum += 1
        unless expected == c.to_s
          STDERR.puts "Fail in #{path}##{lnum}:"
          STDERR.puts "Expected: #{expected.inspect}"
          STDERR.puts "Got:      #{c.to_s.inspect}"
          break
        end
      end
    rescue Exception => e
      STDERR.puts e
    end
    file.close
  end
end
