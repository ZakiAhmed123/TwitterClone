require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get timeline" do
    get :timeline
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
