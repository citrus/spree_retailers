Rails.application.routes.draw do
  
  get '/retailers/:id/:country' => 'retailers#index', :as => :country_retailers
  resources :retailers, :only => :index

  namespace :admin do
    resources :retailers
  end

end