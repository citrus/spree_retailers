Spree Retailers
---------------

Spree Retailers is a simple Spree Extension.


Demo
----

To create a spree retailers demo app, run the following:
  
    rails new spree_retailers_example 
    cd spree_retailers_example 
    echo "gem 'spree', '0.40.2'" >> Gemfile 
    echo "gem 'spree_retailers', '0.40.0.1'" >> Gemfile 
    rm public/index.html 
    bundle install 
    rake spree:install spree_retailers:install db:migrate db:seed db:admin:create


Or all at once:

    rails new spree_retailers_example; cd spree_retailers_example; echo "gem 'spree', '0.40.2'" >> Gemfile; echo "gem 'spree_retailers', '0.40.0.1'" >> Gemfile; rm public/index.html; bundle install; rake spree:install spree_retailers:install db:migrate db:seed db:admin:create

`rake db:sample` if you want to...

Then start the server with `rails s`



To Do
-----

* Write real tests 

License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.