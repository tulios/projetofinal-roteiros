require 'test_helper'

class EventTipsControllerTest < ActionController::TestCase
  
  test "Deveria carregar o new" do
    login_as :quentin
    
    get :new, :event_id => events(:one).to_param
    assert_response :success
    
    assert(assigns(:event))
    assert(assigns(:event_tip))
    assert(assigns(:event_tip).tip)
  end
  
  test "Deveria criar uma nova dica de evento" do
    login_as :quentin
  
    assert_difference('EventTip.count and Tip.count') do
      create_event_tip(events(:one).to_param)
      assert(assigns(:tip))
      assert(assigns(:event_tip))
      assert_response :redirect
    end

    assert_redirected_to event_path(assigns(:event_tip).event)
  end
  
  test "Deveria apagar uma dica de evento" do
    login_as :quentin
  
    assert_difference('EventTip.count and Tip.count', -1) do
      delete :destroy, :id => event_tips(:one).to_param
    end

    assert_redirected_to event_path(assigns(:event_tip).event)
  end
  
  test "Deveria validar a presença de name e description" do
    login_as :quentin
  
    assert_no_difference('EventTip.count and Tip.count') do
      create_event_tip(events(:one).to_param,
        {:name => nil, :description => nil}
      )
      
      assert(assigns(:tip).errors.on(:name))
      assert(assigns(:tip).errors.on(:description))
    end
  end
  
  protected
  
  def create_event_tip(event_id, options = {})
    tip_hash = {
      :name => "NomeDaDica",
      :description => "DescricaoDaDica",
    }
    
    post :create, :event_id => event_id, :tip => tip_hash.merge(options)
  end
end
