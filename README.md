Spree Retailers
===============

Spree Retailers is a simple Spree Extension that adds a retailers page as well as a retailers admin.


Demo
----

To create a spree retailers demo app, run the following:
  
    rails new spree_retailers_example 
    cd spree_retailers_example 
    echo "gem 'spree', '0.40.2'" >> Gemfile 
    echo "gem 'spree_retailers'" >> Gemfile 
    rm public/index.html
    bundle install
    rake spree:install spree_retailers:install db:migrate db:seed db:admin:create

Or all at once:

    rails new spree_retailers_example; cd spree_retailers_example; echo "gem 'spree', '0.40.2'" >> Gemfile; echo "gem 'spree_retailers'" >> Gemfile; rm public/index.html; bundle install; rake spree:install spree_retailers:install db:migrate db:seed db:admin:create

`rake spree_sample:install db:sample` if you want to...

Then start the server with `rails s`


To Do
-----

* Write controller tests

License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License All rights reserved.