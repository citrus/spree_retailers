# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
require 'rake/testtask'
#require 'rake/rdoctask'

Bundler::GemHelper.install_tasks

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test


desc "Builds dummy app for testing"
task :test_app do
  require 'spree_retailers/generators/test_app_generator'
  SpreeRetailers::Generators::TestAppGenerator.start
end



#require 'bundler'
#require 'rake/testtask'
#Bundler::GemHelper.install_tasks
#
#Rake::TestTask.new do |t|
#  t.libs << "lib"
#  t.pattern = 'test/**/*_test.rb'
#  t.verbose = true
#end
#
#desc "Default Task"
#task :default => [ :test ]
#
#
#desc "Builds dummy app for testing"
#task :test_app do
#  require 'spree_retailers/generators/test_app_generator'
#  SpreeRetailers::Generators::TestAppGenerator.start
#end