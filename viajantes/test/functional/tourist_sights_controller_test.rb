require 'test_helper'

class TouristSightsControllerTest < ActionController::TestCase
  test "Deveria carregar o index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tourist_sights)
  end

  test "Deveria carregar o new" do
    get :new
    assert_response :success
  end

  test "Deveria criar um ponto turistico" do
    assert_difference('TouristSight.count') do
			conteudo = { :name => "PontoTuristico3", :address => "Endereco3", :city_id => "1" }
      post :create, :tourist_sight => conteudo
    end

    assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
  end

  test "Deveria exibir um tourist_sight" do
		id = tourist_sights(:one).to_param
	
    get :show, :id => id
    assert_response :success
  end

  test "Deveria carregar o edit" do
		id = tourist_sights(:one).to_param

    get :edit, :id => id
    assert_response :success
  end

  test "Deveria atualizar um tourist_sight" do
    put :update, :id => tourist_sights(:one).to_param, :tourist_sight => { }
    assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
  end

  test "Deveria apagar um tourist_sight" do
    assert_difference('TouristSight.count', -1) do
      delete :destroy, :id => tourist_sights(:one).to_param
    end

    assert_redirected_to tourist_sights_path
  end
end
