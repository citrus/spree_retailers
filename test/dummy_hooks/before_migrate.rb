# run install generators
run "rails g spree:site"
run "rails g spree_retailers:install"

# remove all stylesheets except core  
%w(admin store).each do |ns|
  template "#{ns}/all.js", "app/assets/javascripts/#{ns}/all.js", :force => true
  template "#{ns}/all.css", "app/assets/stylesheets/#{ns}/all.css", :force => true
end
