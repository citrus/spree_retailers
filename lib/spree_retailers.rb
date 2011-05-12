require 'spree_core'
require 'spree_auth'

require 'geokit'
require 'spree_retailers/version'
require 'spree_retailers/custom_hooks'

module SpreeRetailers
  
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

  end
end