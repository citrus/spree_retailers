require "test_helper"

class Spree::Admin::RetailersIntegrationTest < ActiveSupport::IntegrationCase
  
  def setup
    @image = File.expand_path("../../../../support/files/1.jpg", __FILE__)
    @retailer_type = retailer_types(:one)
  end
  
  should "get the retailers index" do
    visit spree.admin_retailers_path
    assert has_link?("New Retailer")
    assert_seen "Listing Retailers"
  end
  
  should "paginate the retailers index" do
    Spree::Retailer.destroy_all
    Spree::Config.set(:orders_per_page => 2)
    1.upto(3) { |i|
      Spree::Retailer.create(:retailer_type_id => @retailer_type.id, :name => "Retailer ##{i}", :address => "#{i * 100} State St", :city => "Santa Barbara")
    }
    visit spree.admin_retailers_path
    within ".pagination" do
      assert has_link?("2")
      click_link "2"
    end
    assert_seen "Retailer #3", :within => "table.index"
    assert_match /page\=2/, current_url
  end
  
  should "create a retailer" do
    visit spree.admin_retailers_path
    click_link "New Retailer"
    select @retailer_type.name, :from => "Type"
    fill_in "Name", :with => "OMG Retailer"
    fill_in "Address", :with => "1000 State St"
    fill_in "City", :with => "Santa Barbara"
    attach_file "Logo Image", @image
    click_button "Create"
    assert_equal spree.admin_retailers_path, current_path
    assert_flash %(Retailer "OMG Retailer" has been successfully created!)
  end
  
  should "fail to create a retailer" do
    visit spree.admin_retailers_path
    click_link "New Retailer"
    click_button "Create"
    assert_response :success
    within ".errorExplanation" do
      assert_seen "Retailer type can't be blank"
      assert_seen "Name can't be blank"
      assert_seen "Address can't be blank"
      assert_seen "City can't be blank"
    end
  end
  
  context "with an existing retailer" do
  
    setup do 
      @retailer = retailers(:one)
    end
  
    should "display the index" do
      visit spree.admin_retailers_path
      within "tr#retailer_#{@retailer.id}" do
        assert_seen @retailer.name
        within "td.actions" do
          assert find("a.icon_link").native.attribute("href").include?(spree.edit_admin_retailer_path(@retailer))
          assert has_selector?("a[href='#']")
        end
      end
    end
    
    should "edit the retailer" do
      @retailer.update_attribute(:logo, File.open(@image))
      visit spree.edit_admin_retailer_path(@retailer)
      assert_seen "Current Logo", :within => ".edit_retailer p.current-logo"
      assert has_xpath?("//img[@src='#{@retailer.logo.url(:thumb)}']")
      fill_in "Name", :with => "Just another name"
      click_button "Update"
      assert_equal spree.admin_retailers_path, current_path
      assert_flash %(Retailer "Just another name" has been successfully updated!)
    end
    
    should "destroy the retailer" do
      visit spree.admin_retailers_path
      find(".actions a[href='#']").click
      find_by_id("popup_ok").click              
    end
            
  end
  
end
