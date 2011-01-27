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
  s.summary     = %q{Spree Retailers adds a retailer admin to Spree.}
  s.description = %q{}

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'config/**/*', 'lib/**/*', 'app/**/*', 'db/**/*', 'Rakefile']
  s.test_files   = Dir['test']
  
  s.require_paths = ["lib"]

  s.has_rdoc = false

  s.add_dependency('spree_core', '>= 0.40.2')
  s.add_dependency('spree_auth', '>= 0.40.2')
  
end