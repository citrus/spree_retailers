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
  s.description = %q{Spree Retailers adds a retailer page and admin to Spree Commerce.}

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'config/**/*', 'lib/**/*', 'app/**/*', 'db/**/*', 'Rakefile']
  s.test_files   = Dir['test']
  
  s.require_paths = ["lib"]

  s.has_rdoc = false

  s.add_dependency('spree_core', '>= 0.40.2')
  s.add_dependency('spree_auth', '>= 0.40.2')
  s.add_dependency('mail',       '>= 2.2.0')
  s.add_dependency('geokit',     '>= 1.5.0')
  
  s.add_development_dependency('spree', '>= 0.40.2')
	s.add_development_dependency('shoulda', '>= 2.11.3')
	s.add_development_dependency('sqlite3-ruby', '>= 1.3.2')

end