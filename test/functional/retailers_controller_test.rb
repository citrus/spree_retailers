require 'test_helper'

class RetailersControllerTest < ActionController::TestCase
  
  should "get index" do
    get :index
    assert_not_nil assigns(:states)
    assert_not_nil assigns(:retailers)
    assert_response :success
  end
  
end
