require 'test_helper'

class YoutubeControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get display" do
    get :display
    assert_response :success
  end

end
