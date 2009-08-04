require 'test_helper'

class TouristSightCityFinderControllerTest < ActionController::TestCase
  
  test "Deveria carregar os pontos turisticos pela cidade" do
    
    get :index, :city_id => 1
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_equal(2,assigns(:tourist_sights).length)
  end

end
