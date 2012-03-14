Spree::Core::Engine.routes.append do

  namespace :admin do
    resources :retailer_types, :constraints => { :id => /.*/ }
    resources :retailers
  end

  resources :retailers, :only => :index
  get '/:retailer_type_id' => 'retailers#index', :as => :retailer_type, :constraints => { :retailer_type_id => /.*/ }
  
end
