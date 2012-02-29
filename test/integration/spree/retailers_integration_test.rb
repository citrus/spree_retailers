require "test_helper"

class Spree::RetailersIntegrationTest < ActiveSupport::IntegrationCase
  
  def setup
    @image = File.expand_path("../../../support/files/1.jpg", __FILE__)
    @retailer = retailers(:one)
    @retailer.update_attribute(:logo, File.open(@image))
  end
  
  should "get index of retailers" do
    visit spree.retailers_path
    within ".retailer" do
      assert_seen @retailer.name
      within ".retailer-logo" do
        assert has_xpath?("//img[@src='#{@retailer.logo.url(:thumb)}']")
      end
    end
  end
  
end
