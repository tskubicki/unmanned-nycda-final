require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get friends" do
    get :friends
    assert_response :success
  end

  test "should get messages" do
    get :messages
    assert_response :success
  end

  test "should get roles" do
    get :roles
    assert_response :success
  end

  test "should get games" do
    get :games
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

end
