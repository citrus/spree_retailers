module SpreeRetailers
  class Engine < Rails::Engine
    
    engine_name "spree_retailers"
    
    config.to_prepare do
      #loads application's model / class decorators
      Dir.glob File.expand_path("../../../app/**/*_decorator.rb", __FILE__) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      #loads application's deface view overrides
      Dir.glob File.expand_path("../../../app/overrides/**/*.rb", __FILE__) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.autoload_paths += %W(#{config.root}/lib)

  end
end
