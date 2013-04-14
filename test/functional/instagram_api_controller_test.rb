require 'test_helper'

class InstagramApiControllerTest < ActionController::TestCase
  test "should get instagram_search" do
    get :instagram_search
    assert_response :success
  end

  test "should get instagram_display" do
    get :instagram_display
    assert_response :success
  end

end
