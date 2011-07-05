require 'test_helper'

class SelectorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
