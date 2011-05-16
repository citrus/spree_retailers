require 'test_helper'

class RetailerTest < ActiveSupport::TestCase
  
  fixtures :all
  
  should validate_presence_of(:name)
  should validate_presence_of(:address)
  should validate_presence_of(:city)
  #should validate_presence_of(:state)
  #should validate_presence_of(:zipcode)
  
  def setup  
  end
  
  context "a new retailer" do
  
    setup do
      @retailer = Retailer.new
    end
    
    should "validate email" do 
      assert !@retailer.valid?
      # email isn't required
      assert !@retailer.errors.include?(:email)
      
      @retailer.email = "some text"
      assert !@retailer.valid?
      # email must be valid
      assert @retailer.errors.include?(:email)
      
      @retailer.email = "spree@example.com"
      assert !@retailer.valid?
      # email is valid
      assert !@retailer.errors.include?(:email)
    end
    
    should "require state in the US" do
      @retailer.country = "United States"
      assert !@retailer.valid?      
      assert @retailer.errors.include?(:state)
    end
    
    should "not require state outside of the US" do
      @retailer.country = "Switzerland"
      assert !@retailer.valid?      
      assert !@retailer.errors.include?(:state)      
    end
    
    
    should "require zip code in the US" do
      @retailer.country = "United States"
      assert !@retailer.valid?      
      assert @retailer.errors.include?(:zipcode)      
    end
    
    should "not require zip code outside of the US" do
      @retailer.country = "Switzerland"
      assert !@retailer.valid?      
      assert !@retailer.errors.include?(:zipcode)      
    end
    

  end
  
  context "an existing retailer" do
  
    setup do
      @retailer = retailers(:one)
    end
        
    should "normalize url field" do
      @retailer.url = "http://example.com"
      assert_equal "http://example.com", @retailer.url
      @retailer.url = "example.com"
      assert_equal "http://example.com", @retailer.url
    end
    
    should "check has_url?" do
      @retailer.url = nil
      assert !@retailer.has_url?, "has_url? should be false on nil"
      
      @retailer.url = ""
      assert !@retailer.has_url?, "has_url? should be false on empty string"
      
      @retailer.url = "http://"
      assert !@retailer.has_url?, "has_url? should be false on http://"
  
      @retailer.url = "http://example.com"
      assert @retailer.has_url?, "has_url? should be true on real full url"
    end
    
    should "keep https on url" do
      url = "https://example.com"
      @retailer.url = url
      assert_equal url, @retailer.url
    end
    
    should "have empty optional values" do
      [:address2, :phone, :email].each do |property|
        @retailer.send("#{property}=", nil)
        assert !@retailer.send("has_#{property}?")
      end
    end
      
    should "have optional values" do    
      @retailer.address2 = "Suite 2"
      assert @retailer.has_address2?
      
      @retailer.phone = "555-555-5555"
      assert @retailer.has_phone?
      
      @retailer.email = "spree@example.com"
      assert @retailer.has_email?
    end
  
  end
  
  context "a non-geocoded retailer" do
  
    setup do
      @retailer = retailers(:one)
    end
  
    should "get geocoded" do
      assert !@retailer.geocoded?
      @retailer.address = "111 Cabrillo Blvd"
      @retailer.valid?
      assert @retailer.geocoded?
    end 
        
  end
  
end