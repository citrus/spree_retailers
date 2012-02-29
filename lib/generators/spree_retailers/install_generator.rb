module SpreeRetailers
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      desc "Installs required migrations for spree_retailers"
      source_root File.expand_path("../../templates/db/migrate", __FILE__)
      
      def copy_migrations
        rake "spree_retailers:install:migrations"        
      end

    end
  end
end
