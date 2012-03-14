namespace :db do
  namespace :sample do
    desc "Create admin username and password"
    task :retailers => :environment do
    
      require "ffaker"
      
      unless Spree::Retailer.count == 0
        require "highline/import"
        continue = ask("Sample data will destroy existing data. Continue? [y/n]")
        exit unless continue =~ /y/i
      end
      
      Spree::RetailerType.destroy_all
      
      images = Dir[File.expand_path("../sample", __FILE__) + "/*.jpg"]
      
      %w(Retailer Distributor).each do |type|
        type = Spree::RetailerType.create(:name => type, :permalink => type.downcase.pluralize)

        (10 + rand(10)).times{|i|
          image = File.open(images[rand(images.length)])
          type.retailers.create(
            :name      => Faker::Company.name,
            :address   => Faker::Address.street_address,
            :city      => Faker::Address.city,
            :state     => Faker::Address.us_state,
            :country   => "United States",
            :zipcode   => Faker::Address.zip_code,
            :phone     => Faker::PhoneNumber.phone_number,
            :email     => Faker::Internet.email,
            :url       => Faker::Internet.domain_name,
            :logo      => image
          )
          image.close
        }    
      end
          
      puts "done."
      
    end
  end
end
