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

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

class ActiveSupport::TestCase
  self.fixture_path = File.expand_path("../fixtures", __FILE__)
  fixtures :all
end

class ActionController::TestCase
  self.fixture_path = File.expand_path("../fixtures", __FILE__)
end
