require 'test_helper'

class CarSimControllerTest < ActionController::TestCase
  test "should get simulate" do
    get :simulate
    assert_response :success
  end

end
