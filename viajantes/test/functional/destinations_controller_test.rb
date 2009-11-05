require 'test_helper'

class DestinationsControllerTest < ActionController::TestCase

  test "deveria carregar o new" do
    login_as :quentin
  
    get :new, :roadmap_id => roadmaps(:one).to_param
    assert_response :success
    
    assert(assigns(:destination))
    assert(assigns(:destination).roadmap)
    assert(assigns(:states))
    assert(assigns(:vehicles))    
    
    assert_equal(State.count, assigns(:states).size)
    assert_equal(Vehicle.count, assigns(:vehicles).size)
  end

  test "deveria criar um destino" do
    login_as :quentin
  
    assert_difference('Destination.count') do
      create_destination(roadmaps(:one).to_param)
      assert(assigns(:destination))
      assert_response :redirect
    end

    assert_redirected_to roadmap_path(assigns(:destination).roadmap)
  end
  
  test "deveria validar a presenca de city" do
    login_as :quentin
  
    assert_no_difference('Destination.count') do
      create_destination(roadmaps(:one).to_param, {:city_id => nil})

      assert(assigns(:destination).errors.on(:city_id))
    end
  end
  
  test "deveria validar a presenca de start_date" do
    login_as :quentin
  
    assert_no_difference('Destination.count') do
      create_destination(roadmaps(:one).to_param, {:start_date => nil})

      assert(assigns(:destination).errors.on(:start_date))
    end
  end

  test "deveria validar a presenca de end_date" do
    login_as :quentin
  
    assert_no_difference('Destination.count') do
      create_destination(roadmaps(:one).to_param, {:end_date => nil})

      assert(assigns(:destination).errors.on(:end_date))
    end
  end

  test "deveria carregar o edit" do
    login_as :quentin
    
    get :edit, :id => destinations(:one).to_param, :roadmap_id =>  destinations(:one).roadmap.to_param
    assert_response :success

    assert(assigns(:destination))
    assert(assigns(:roadmap))

    assert(assigns(:destinations))
    assert(assigns(:states))
    assert(assigns(:vehicles))
    assert(assigns(:cities))
    
    assert_equal(State.count, assigns(:states).size)
    assert_equal(Vehicle.count, assigns(:vehicles).size)
    
  end

  test "deveria atualizar um destino" do
    login_as :quentin
    
    update_destination destinations(:one).to_param, destinations(:one).roadmap.to_param
    assert_redirected_to roadmap_path(assigns(:destination).roadmap)
  end

  test "deveria apagar um destino" do
    login_as :quentin
  
    assert_difference('Destination.count', -1) do
      delete :destroy, :id => destinations(:one).to_param
    end

    assert_redirected_to roadmap_path(destinations(:one).roadmap)
  end
  
  # Métodos protegidos
  protected
  
  def create_destination(roadmap_id, options = {})
  
    destination_hash = {:city_id => cities(:one).to_param,
                        :vehicle_id => vehicles(:one).to_param,
                        :start_date => Converters::date_to_string(Date.today + 1.day),
                        :end_date => Converters::date_to_string(Date.today + 10.days),
                        :planned_cost => 100.0
                      }
    post :create, :roadmap_id => roadmap_id, :destination => destination_hash.merge(options)
  end
  
  def update_destination(id, roadmap_id, options = {})
  
    destination_hash = {:city_id => cities(:one).to_param,
                        :vehicle_id => vehicles(:one).to_param,
                        :start_date => Converters::date_to_string(Date.today + 1.day),
                        :end_date => Converters::date_to_string(Date.today + 10.day),
                        :planned_cost => 100.0
                      }
    post :update, :id => id, :roadmap_id => roadmap_id, :destination => destination_hash.merge(options)
  end
  
end
