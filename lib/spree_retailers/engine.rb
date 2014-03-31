module SpreeRetailers
  class Engine < Rails::Engine
    engine_name "spree_retailers"
    
    config.to_prepare do
      Dir.glob File.expand_path("../../../app/**/*_decorator.rb", __FILE__) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.autoload_paths += %W(#{config.root}/lib)
  end
end
