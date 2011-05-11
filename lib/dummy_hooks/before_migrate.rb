say_status "installing", "spree_core, spree_auth and spree_retailers", :cyan

inside destination_path do

  rake "spree_core:install"
  rake "spree_auth:install"
  rake "spree_retailers:install"

end