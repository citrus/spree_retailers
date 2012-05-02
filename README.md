# Spree Retailers [![Build Status](https://secure.travis-ci.org/citrus/spree_retailers.png)](http://travis-ci.org/citrus/spree_retailers)

Spree Retailers is a Spree extension for listing your company's retail stores on your web site.


------------------------------------------------------------------------------
Installation
------------------------------------------------------------------------------

As usual, add 'spree_retailers' to your Gemfile and run bundle install:
  
```ruby  
# Spree 1.0.x
gem 'spree_retailers', '1.0.0.0'

# Spree 0.70.x
gem 'spree_retailers', '0.70.0.0'

# Spree 0.50.x, 0.60.x
gem 'spree_retailers', '0.50.0.0'

# Spree 0.40.x 
gem 'spree_retailers', '0.40.0.4'

# install from source
gem 'spree_retailers', :git => 'git://github.com/citrus/spree_retailers.git'
```


Next, copy the migration file to your project:

```bash
# Spree 0.40.x, 0.50.x and 0.60.x
rake spree_retailers:install

# 0.70.x and above
rails g spree_retailers:install
```


Now, migrate your database with:

```bash
rake db:migrate
```

------------------------------------------------------------------------------
CSV Import
------------------------------------------------------------------------------

To import retailers via a CSV:

```rake spree_retailers:import FILE=international_distributors.csv TYPE=Distributors SKIP_VALIDATION=true```

Where the CSV file contains headers with the following names:  
name, address, city, state, country, zipcode, phone, email, url, logo. `SKIP_VALIDATION` is only really helpful when you importing data that is missing the address fields

------------------------------------------------------------------------------
Testing
------------------------------------------------------------------------------

If you'd like to run tests:

```bash    
git clone git://github.com/citrus/spree_retailers.git
cd spree_retailers
bundle install
bundle exec dummier
bundle exec rake
```


------------------------------------------------------------------------------
Demo
------------------------------------------------------------------------------

If you'd like a demo of spree_retailers:

```bash
git clone git://github.com/citrus/spree_retailers.git
cd spree_retailers
cp test/dummy_hooks/after_migrate.rb.sample test/dummy_hooks/after_migrate.rb
bundle install
bundle exec dummier
cd test/dummy
rails s
```  


------------------------------------------------------------------------------
To Do
------------------------------------------------------------------------------

* Google map integration (we're already geocoding, so why not?)
* Add (better) International Support


------------------------------------------------------------------------------
License
------------------------------------------------------------------------------

Copyright (c) 2011 - 2012 Spencer Steffen and Citrus, released under the New BSD License All rights reserved.
