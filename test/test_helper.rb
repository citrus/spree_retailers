# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

env = File.expand_path("../dummy/config/environment.rb",  __FILE__)
if File.exists?(env)
  require env
else
  raise LoadError, "Please create the dummy app before running tests."
end

require "rails/test_help"
require "shoulda"

ActionMailer::Base.delivery_method    = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Recreate the URL helper so we don't need to depend on spree, just spree_core
module Spree::UrlHelpers
  def spree
    Spree::Core::Engine.routes.url_helpers
  end
end

module FixturesHelper  
  def self.included(base)
    base.class_eval do
      self.fixture_path = File.expand_path("../fixtures/spree", __FILE__)
      set_fixture_class :retailers => Spree::Retailer
      fixtures :retailers
    end
  end  
end

class ActiveSupport::TestCase
  include FixturesHelper
end

class ActionController::TestCase
  include Spree::UrlHelpers
  include FixturesHelper
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| load f }
