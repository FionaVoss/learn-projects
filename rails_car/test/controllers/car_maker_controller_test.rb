require 'test_helper'

class CarMakerControllerTest < ActionController::TestCase
  test "should get make_car" do
    get :make_car
    assert_response :success
  end

end
