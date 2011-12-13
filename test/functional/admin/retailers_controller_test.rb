require 'test_helper'

class Admin::RetailersControllerTest < ActionController::TestCase
  
  fixtures :states, :retailers
  
  should "get index" do
    get :index
    assert_not_nil assigns(:retailers)
    assert_response :success
  end
    
  should "get new" do
    get :new
    assert_not_nil assigns(:retailer)
    assert assigns(:retailer).new_record?
    assert_response :success
  end
  
  should "post to create" do
    post :create, :retailer => { "name" => "Rita Taylor", "address" => "1000 State St", "address2" => "Suite 100", "city" => "Santa Barbara", "state" => "CA", "zipcode" => "93101", "country" => "United States", "phone" => "805-555-5555", "email" => "ritataylor@example.com", "url" => "ritataylor.example.com" }
    retailer = assigns(:retailer)
    assert_not_nil retailer
    assert retailer.errors.empty?
    assert !retailer.new_record?
    assert_redirected_to admin_retailers_path
  end
  
  context "With an existing retailer" do
    
    setup do
      @retailer = retailers(:one)
    end
    
    should "get edit" do
      get :edit, :id => @retailer.to_param
      assert_not_nil assigns(:retailer)
      assert_response :success
    end
    
    should "put to update" do
      put :update, :id => @retailer.to_param, :retailer => { "name" => "Buy From-us-alot", "address" => "2400 State St", "address2" => "", "city" => "Santa Barbara", "state" => "CA", "zipcode" => "93101", "country" => "United States", "phone" => "805-555-5555", "email" => "ritataylor@example.com", "url" => "ritataylor.example.com" }
      assert_not_nil assigns(:retailer)
      assert_redirected_to admin_retailers_path
    end
    
    should "delete to destroy" do
      delete :destroy, :id => @retailer.to_param
      assert_redirected_to admin_retailers_path
    end    
    
  end  
  
end
