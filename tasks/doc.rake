task :doc do
  begin
    require 'yard'
    YARD::Rake::YardocTask.new(:doc) do |t|
      t.files   = ['lib/**/*.rb']
      t.options = ['--no-private']
    end
  rescue LoadError
    STDERR.puts "Install yard if you want prettier docs"
    require 'rdoc/task'
    Rake::RDocTask.new(:doc) do |rdoc|
      rdoc.rdoc_dir = "doc"
      rdoc.title = "UsbMon - parser for 'usbmon' and a DigitDia protocol interpreter"
    end
  end
end
