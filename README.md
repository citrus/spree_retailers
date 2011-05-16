Spree Retailers
===============

Spree Retailers is a simple Spree Extension that adds a retailers page as well as a retailers admin.


Installation
------------

As usual, add 'spree_retailers' to your Gemfile and run bundle install:
    
    # Spree 0.50.x
    gem 'spree_retailers', '0.50.0.0'
    
    # Spree 0.40.x 
    gem 'spree_retailers', '0.40.0.4'
    
    # install from git
    gem 'spree_retailers', :git => 'git://github.com/citrus/spree_retailers.git'


Now, copy the migration file to your project:

    # Spree 0.40.x and 0.50.x
    rake spree_retailers:install
    
    # Edge
    rails g spree_retailers:install


That should do it!



To Do
-----

* Write controller tests
* Write admin tests
* Google map integration (we're already geocoding, so why not?)
* Add (better) International Support


License
-------

Copyright (c) 2011 Spencer Steffen and Citrus, released under the New BSD License All rights reserved.