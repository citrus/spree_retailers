Spree::Core::Engine.routes.append do

  namespace :admin do
    resources :retailer_types, :constraints => { :id => /.*/ }
    resources :retailers
  end

  get '/:retailer_type_id' => 'retailers#index', :as => :retailer_type, :constraints => { :retailer_type_id => /.*/ }
  resources :retailers, :only => :index
  
end
