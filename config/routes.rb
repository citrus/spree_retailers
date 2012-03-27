class Spree::PossibleRetailerType
  def self.matches?(request) 
    return false if request.fullpath =~ /(^\/+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+)/
    !Spree::RetailerType.find_by_permalink(request.fullpath).nil?
  end
end

Spree::Core::Engine.routes.append do

  namespace :admin do
    resources :retailer_types, :constraints => { :id => /.*/ }
    resources :retailers
  end

  constraints(Spree::PossibleRetailerType) do
    get '(:retailer_type_id)', :to => 'retailers#index', :retailer_type_id => /.*/, :as => :retailer_type
  end
  
  resources :retailers, :only => :index
  
end
