require 'test_helper'

class TouristSightTipsControllerTest < ActionController::TestCase
 
  test "Deveria carregar o new" do
    login_as :quentin
    
    get :new, :tourist_sight_id => tourist_sights(:one).to_param
    assert_response :success
    
    assert(assigns(:tourist_sight))
    assert(assigns(:tourist_sight_tip))
    assert(assigns(:tourist_sight_tip).tip)
  end
  
  test "Deveria criar uma nova dica de ponto turístico" do
    login_as :quentin
  
    assert_difference('TouristSightTip.count and Tip.count') do
      create_tourist_sight_tip(roadmaps(:one).to_param)
      assert(assigns(:tip))
      assert(assigns(:tourist_sight_tip))
      assert_response :redirect
    end

    assert_redirected_to tourist_sight_path(assigns(:tourist_sight_tip).tourist_sight)
  end
  
  protected
  
  def create_tourist_sight_tip(tourist_sight_id, options = {})
    tip_hash = {
      :name => "NomeDaDica",
      :description => "DescricaoDaDica",
    }
    
    post :create, :tourist_sight_id => tourist_sight_id, :tip => tip_hash.merge(options)
  end
 
end
