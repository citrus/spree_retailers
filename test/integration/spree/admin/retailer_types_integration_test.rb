#! /usr/bin/env ruby
# encoding: UTF-8

require 'test_helper'

class Spree::Admin::RetailerTypesIntegrationTest < ActiveSupport::IntegrationCase
 
  context "create a retailer type" do
    
    should "validate retailer type" do
      visit spree.new_admin_retailer_type_path
      click_button "Create"
      within "#errorExplanation" do
        assert_seen "errors prohibited this record from being saved:"
        assert_seen "Name can't be blank"
        assert_seen "Permalink is invalid"
      end
    end
      
    should "Create a new retailer type" do
      Spree::RetailerType.destroy_all(:permalink => "retailers")
      visit spree.admin_retailer_types_path
      btn = find("#new_retailer_type_link").native
      assert_match /#{spree.new_admin_retailer_type_path}$/, btn.attribute('href')
      assert_equal "New Retailer Type", btn.text
      btn.click
      within "#new_retailer_type" do
        fill_in "Name", :with => "Retailers"
        fill_in "Permalink", :with => "retailers"
      end
      click_button "Create"
      assert_flash %(Retailer type "Retailers" has been successfully created!)
    end
  
  end
  
  context "an existing retailer type" do    
    
    setup do
      @retailer_type = retailer_types(:one)
    end
    
    should "edit and update" do
      Spree::RetailerType.destroy_all(:permalink => "distributors")
      visit spree.admin_retailer_types_path
      within "tr#retailer_type_#{@retailer_type.id}" do
        click_link "Edit"
      end
      within "#edit_retailer_type_#{@retailer_type.id}" do
        fill_in "Name", :with => "Distributors"
        fill_in "Permalink", :with => "distributors"
      end
      click_button "Update"
      assert_equal spree.admin_retailer_types_path, current_path
      assert_flash %(Retailer type "Distributors" has been successfully updated!)
    end
    
    should "redirect when visting show" do
      visit spree.admin_retailer_type_path(@retailer_type)
      assert_equal spree.admin_retailer_types_path, current_path
    end
    
    should "get destroyed" do
      visit spree.admin_retailer_types_path
      within "tr#retailer_type_#{@retailer_type.id}" do
        find("a[href='#']").click
      end      
      assert find_by_id("popup_ok").click
    end
    
  end
  
end
