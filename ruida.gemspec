# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruida/version"

Gem::Specification.new do |s|
  s.name        = "ruida"
  s.version     = Ruida::VERSION

  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Klaus Kämpf"]
  s.email       = ["kkaempf@suse.de"]
  s.homepage    = "https://github.com/kkaempf/ruida"
  s.summary     = %q{A 'ruida' (RDWorks Laser Cutter Format) decoder}
  s.description = %q{Decodes the .rd format used by RDWorks to send jobs to lasercutters (like 'Thunderlaser')}

#  s.requirements << %q{}

  s.add_dependency("rdoc")

  s.add_development_dependency('rake')
  s.add_development_dependency('bundler')
  
  s.rubyforge_project = "ruida"

  s.files         = `git ls-files`.split("\n")
  s.files.reject! { |fn| fn == '.gitignore' }
  s.extra_rdoc_files    = Dir['README*', 'CHANGELOG*', 'LICENSE']
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
