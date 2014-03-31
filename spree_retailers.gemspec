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
  
  s.add_dependency 'spree_core', '~> 1.1'
  s.add_dependency 'geokit',     '~> 1.6.5'
  
  s.add_development_dependency 'capybara', '~> 2.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.12.0'
  s.add_development_dependency 'sqlite3'
end
