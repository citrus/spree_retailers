# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_retailers/version"

Gem::Specification.new do |s|

  s.name        = "spree_retailers"
  s.version     = SpreeRetailers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "http://github.com/citrus/spree_retailers"
  s.summary     = %q{Spree Retailers is a Spree extension for listing your company's retail stores on your web site.}
  s.description = %q{Spree Retailers is a Spree extension for listing your company's retail stores on your web site.}

  s.rubyforge_project = "spree_retailers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('spree_core', '>= 0.70.0')
  s.add_dependency('mail',       '>= 2.2.0')
  s.add_dependency('geokit',     '>= 1.5.0')
  
  s.add_development_dependency('dummier', '>= 0.2.4')
	s.add_development_dependency('shoulda', '>= 3.0.0.beta2')
	s.add_development_dependency('sqlite3', '>= 1.3.2')
  
end
