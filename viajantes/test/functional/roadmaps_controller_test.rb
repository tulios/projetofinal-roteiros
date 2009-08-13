require 'test_helper'

class RoadmapsControllerTest < ActionController::TestCase
  test "Deveria carregar o index" do
		login_as :quentin

    get :index
    assert_response :success
    assert_not_nil assigns(:roadmaps)
		assert(Roadmap.count > assigns(:roadmaps).length)
  end

  test "Deveria carregar o new" do
		login_as :quentin

    get :new
    assert_response :success
		assert_not_nil assigns(:roadmap)
		assert_not_nil assigns(:states)
  end

  test "Deveria criar um roadmap" do
   login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(3, Roadmap.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { :title => "Roteiro_novo_1", :description => "Descricao_1", :city_id => "1" }
    post :create, :roadmap => conteudo
		assert_equal(3, Roadmap.count)

    assert_redirected_to tourist_sight_path(assigns(:roadmap))
  end

  test "should show roadmap" do
    get :show, :id => roadmaps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => roadmaps(:one).to_param
    assert_response :success
  end

  test "should update roadmap" do
    put :update, :id => roadmaps(:one).to_param, :roadmap => { }
    assert_redirected_to roadmap_path(assigns(:roadmap))
  end

  test "should destroy roadmap" do
    assert_difference('Roadmap.count', -1) do
      delete :destroy, :id => roadmaps(:one).to_param
    end

    assert_redirected_to roadmaps_path
  end
end
