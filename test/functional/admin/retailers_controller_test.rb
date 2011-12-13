require 'test_helper'

class Admin::RetailersControllerTest < ActionController::TestCase
  
  should "get index" do
    get :index
    assert_not_nil assigns(:retailers)
    assert_response :success
  end
    
  should "get new" do
    get :new
    assert_not_nil assigns(:retailers)
    assert_response :success
  end
  
end
