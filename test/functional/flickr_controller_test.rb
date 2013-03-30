require 'test_helper'

class FlickrControllerTest < ActionController::TestCase
  test "should get flickrsearch" do
    get :flickrsearch
    assert_response :success
  end

  test "should get display" do
    get :display
    assert_response :success
  end

end
