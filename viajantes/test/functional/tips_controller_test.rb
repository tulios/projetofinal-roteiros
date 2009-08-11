require 'test_helper'

class TipsControllerTest < ActionController::TestCase
	
	test "Deveria mostrar uma dica do ponto turistico" do
		id = tips(:one).to_param
		
		# Verifica que o controlador respondeu sucesso
    get :show, :id => id
    assert_response :success

		# Verifica que ele carregou o objeto
		assert_not_nil assigns(:tip)
		assert_equal(Integer(id), assigns(:tip).id)
	end
	
	test "Deveria carregar o new" do
    login_as :quentin

		# Verifica que o controlador respondeu sucesso
    get :new, :tourist_sight_id => tourist_sights(:one).to_param
    assert_response :success

		# Verifica que ele instanciou a dica
		assert_not_nil assigns(:tip)
	end
	
	test "Deveria carregar o edit" do
    login_as :quentin

		# Verifica que o controlador respondeu sucesso
    get :edit, :id => tips(:one).to_param
    assert_response :success

		# Verifica que ele instanciou a dica
		assert_not_nil assigns(:tip)
		assert_not_nil assigns(:tourist_sight)
	end
	
	test "Deveria criar uma nova dica" do
    login_as :quentin

		tourist_sight_id = tourist_sights(:one).to_param
	
		# Verifica que so existem as dicas criadas pela fixture
		assert_equal(1, Tip.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { :name => "TipName1", :description => "TipDesc1" }
    post :create, :tip => conteudo, :tourist_sight_id => tourist_sight_id
		assert_equal(2, Tip.count)

    assert_redirected_to tourist_sight_path(assigns(:tip).tourist_sight)
	end
	
	test "Deveria atualizar os dados de uma dica" do
    login_as :quentin

		TIP_NAME = "TipName1"
		TIP_DESC = "TipDesc1"
		
		tip_id = tips(:one).to_param
		
		# Realiza o update
		conteudo = { :name => "TipName1", :description => "TipDesc1" }
		post :update, :id => tip_id, :tip => conteudo
		
		assert_not_nil assigns(:tip)
		
		tip = Tip.find(tip_id);
		assert_equal(TIP_NAME, tip.name)
		assert_equal(TIP_DESC, tip.description)
	end
	
	test "Deveria excluir uma dica" do
    login_as :quentin
    
		tip_id = tips(:one).to_param
		
		delete :destroy, :id => tip_id
		
		assert_redirected_to assigns(:tip).tourist_sight
	end

  test "Deveria recuperar todas as dicas de um determinado ponto turistico" do
    ts = TouristSight.find(tourist_sights(:one).to_param)
		# Cria 20 dicas para o ponto turistico
		(1..20).each do |number|
			tip = Tip.new({:name => "Tips#{number}", :description => "Desc#{number}", :tourist_sight => ts})
			tip.save
		end
    
    login_as :quentin
    get :index, :tourist_sight_id => ts.id
    assert_response :success

    # Vem 10 pois é paginado
    assert_equal(10, assigns(:tips).length)
  end
end
