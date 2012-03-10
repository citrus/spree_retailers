Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :retailer_types, :constraints => { :id => /.*/ }
    resources :retailers
  end

  get '/retailers/:id/:country' => 'retailers#index', :as => :country_retailers
  resources :retailers, :only => :index
  
end
