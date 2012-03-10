require 'test_helper'

class Spree::RetailerTypeTest < ActiveSupport::TestCase

  subject do
    Spree::RetailerType.new(:name => "OMG!")
  end
  
  should have_many(:retailers)
  should validate_presence_of(:name)
  should ensure_length_of(:permalink).is_at_least(3).is_at_most(40)
                
  [ "no spaces", "Chars!!", "-", "_", "/" ].each do |val|
    should_not allow_value(val).for(:permalink)
  end
  
  [ "dash-es", "under_scores", "CAPS", "CamelCase", "/perma/link/" ].each do |val|
    should allow_value(val).for(:permalink)
  end

  should "automatically set permalink" do
    @retailer_type = Spree::RetailerType.create(:name => "This should parameterize", :permalink => "")
    assert_equal "this-should-parameterize", @retailer_type.permalink
  end
  
  should "normalize permalink" do
    @retailer_type = Spree::RetailerType.create(:name => "This should parameterize", :permalink => "//omG-PERMA-link__-/")
    assert_equal "omg-perma-link", @retailer_type.permalink
  end
      
  context "an existing retailer_type" do
    
    setup do
      @retailer_type = retailer_types(:one)
    end
    
    should validate_uniqueness_of(:permalink)
    
    should "find by permalink" do
      assert_equal @retailer_type, Spree::RetailerType.find_by_permalink(@retailer_type.permalink)
    end
    
    should "find by permalink when double slashes are present" do
      assert_equal @retailer_type, Spree::RetailerType.find_by_permalink("/" + @retailer_type.permalink)
    end
    
    should "find by permalink when trailing slashes are present" do
      assert_equal @retailer_type, Spree::RetailerType.find_by_permalink(@retailer_type.permalink + "/")
    end
    
  end

end
