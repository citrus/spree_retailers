Rails.application.routes.draw do
  
  resources :retailers

  namespace :admin do
    resources :retailers
  end

end