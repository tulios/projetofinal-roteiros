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
		assert_equal(4, Roadmap.count)

    assert_redirected_to roadmap_path(assigns(:roadmap))
		
		# Verifica se o usuario foi definido
		assert_not_nil assigns(:roadmap).user
		assert assigns(:roadmap).user.id > 0
  end

  test "Deveria detalhar um roadmap" do
		login_as :quentin
		
    get :show, :id => roadmaps(:one).to_param
    assert_response :success
		assert_not_nil assigns(:roadmap)
		assert_not_nil assigns(:city)
  end

  test "Deveria carregar o editar de roadmap" do
		login_as :quentin

    get :edit, :id => roadmaps(:one).to_param
    assert_response :success
		
		assert_not_nil assigns(:roadmap)
		assert_not_nil assigns(:states)
		assert_not_nil assigns(:cities)
  end

  test "Deveria atualizar um roadmap" do
    login_as :quentin

		dados_a_atualizar = { :title => "novo titulo"}
		id = roadmaps(:one).to_param
		rm = Roadmap.find(id)
		
		# Verifica que o obj nao possuia o valor a ser atualizado
		assert_not_equal("novo titulo", rm.title)

		# Verifica se o controlador redirecionou para o lugar correto
    put :update, :id => id, :roadmap => dados_a_atualizar
    assert_redirected_to roadmap_path(assigns(:roadmap))
	
		# Verifica se o valor foi alterado
		rm = Roadmap.find(id)
		assert_equal("novo titulo", rm.title)
  end

  test "Deveria apagar um roadmap" do
    login_as :quentin
    
		id = roadmaps(:one).to_param
		# Veririca a quantidade de objetos antes da exclusao
		assert_equal(3, Roadmap.count)

		# Verifica se o controlador redirecionou para o lugar correto
    delete :destroy, :id => id
    assert_redirected_to roadmaps_path

		# Verifica a quantidade apos a exclusao
		assert_equal(2, Roadmap.count)
  end

	test "Nao deveria permitir acesso as actions sem estar logado" do
		get :index
		assert_redirected_to new_session_path
		get :show
		assert_redirected_to new_session_path
		get :new
		assert_redirected_to new_session_path
		get :create
		assert_redirected_to new_session_path
		get :edit
		assert_redirected_to new_session_path
		get :update
		assert_redirected_to new_session_path
		get :destroy
		assert_redirected_to new_session_path
	end
end














