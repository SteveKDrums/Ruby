require 'test_helper'

class ClassControllerTest < ActionController::TestCase
  test "should get tigers" do
    get :tigers
    assert_response :success
  end

end
