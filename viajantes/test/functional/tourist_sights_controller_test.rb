require 'test_helper'

class TouristSightsControllerTest < ActionController::TestCase

  test "Deveria carregar o index" do
		# Verifica se o controlador respondeu sucesso
    get :index
    assert_response :success

		# Verifica que ele carregou os tourist_sights
    assert_not_nil assigns(:tourist_sights)
  end

  test "Deveria carregar o new" do
    login_as :quentin

		# Verifica se o controlador respondeu sucesso
    get :new
    assert_response :success

		# Verifica que ele criou um obj tourist_sight e carregou os estados disponiveis
		assert_not_nil assigns(:tourist_sight)
		assert_equal(2, assigns(:states).length)
  end

  test "Deveria criar um ponto turistico" do
    login_as :quentin

		# Verifica que so existe os tourist_sight criados pela fixture
		assert_equal(2, TouristSight.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { :name => "PontoTuristico3", :address => "Endereco3", :city_id => "1" }
    post :create, :tourist_sight => conteudo
		assert_equal(3, TouristSight.count)

    assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
  end

  test "Deveria exibir um tourist_sight" do
		id = tourist_sights(:one).to_param
		
		# Verifica que o controlador respondeu sucesso
    get :show, :id => id
    assert_response :success

		# Verifica que ele carregou o objeto
		assert_not_nil assigns(:tourist_sight)
		assert_equal(Integer(id), assigns(:tourist_sight).id)
  end
  
  test "Deveria incrementar o numero de hits ao vizualizar" do
    id = tourist_sights(:one).to_param
    get :show, :id => id

    # Verifica que o hit foi incrementado
		assert_equal(1, assigns(:tourist_sight).hits)
		
		get :show, :id => id		    
		
		# Verifica que o hit foi incrementado
		assert_equal(2, assigns(:tourist_sight).hits)

  end

  test "Deveria carregar o edit" do
    login_as :quentin

		id = tourist_sights(:one).to_param
		
		# Verifica que o controlador respondeu sucesso
    get :edit, :id => id
    assert_response :success

		# Verifica que ele carregou o objeto para edicao
		assert_not_nil assigns(:tourist_sight)
		assert_equal(Integer(id), assigns(:tourist_sight).id)
  end

  test "Deveria atualizar um tourist_sight" do
    login_as :quentin

		dados_a_atualizar = { :name => "novo nome"}
		id = tourist_sights(:one).to_param
		ts = TouristSight.find(id)
		
		# Verifica que o obj nao possuia o valor a ser atualizado
		assert_not_equal("novo nome", ts.name)

		# Verifica se o controlador redirecionou para o lugar correto
    put :update, :id => id, :tourist_sight => dados_a_atualizar
    assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
	
		# Verifica se o valor foi alterado
		ts = TouristSight.find(id)
		assert_equal("novo nome", ts.name)
  end

  test "Deveria apagar um tourist_sight" do
    login_as :quentin
    
		id = tourist_sights(:one).to_param
		# Veririca a quantidade de objetos antes da exclusao
		assert_equal(2, TouristSight.count)

		# Verifica se o controlador redirecionou para o lugar correto
    delete :destroy, :id => id
    assert_redirected_to tourist_sights_path

		# Verifica a quantidade apos a exclusao
		assert_equal(1, TouristSight.count)
  end
  
  test "Deveria filtrar os resultados pela cidade" do
  	# Verifica se o controlador respondeu sucesso
    get :index
    assert_response :success

		# Verifica que ele carregou os tourist_sights
    assert_not_nil assigns(:tourist_sights)
    assert_equal(2, assigns(:tourist_sights).length)
    
    # Verifica que não existem pontos turísticos cadastrados para fortaleza
    get :index, :state_id => 10, :city_id => 2
    assert_response :success
		assert_not_nil assigns(:tourist_sights)
    assert_equal(0, assigns(:tourist_sights).length)
    
    # Verifica que existem 2 pontos turisticos em brasilia
    get :index, :state_id => 20, :city_id => 1
    assert_response :success
		assert_not_nil assigns(:tourist_sights)
    assert_equal(2, assigns(:tourist_sights).length)
  end
  
  test "Deveria filtrar os resultados pela tag" do
  	# - Preparando teste
		# Recuperando tags
		tags_adicionadas = []
		tags_adicionadas << Tag.find(tags(:one).to_param)
		tags_adicionadas << Tag.find(tags(:two).to_param)
		
		# Associando a um ponto turistico
		ts1 = TouristSight.find(tourist_sights(:one).to_param)
		ts1.save_tags(tags_adicionadas)
		# Verificando se salvou
		ts1 = TouristSight.find(ts1.id)
		assert_equal(2, ts1.tags.length)
		
		brasilia_id = cities(:one).to_param
		city = City.find(brasilia_id)
		# - fim preparacao
		
  	# Verifica se o controlador respondeu sucesso
    get :index
    assert_response :success

		# Verifica que ele carregou os tourist_sights
    assert_not_nil assigns(:tourist_sights)
    assert_equal(2, assigns(:tourist_sights).length)
    
    tag1 = Tag.find(tags(:one).to_param)
    tag2 = Tag.find(tags(:two).to_param)
    tag3 = Tag.find(tags(:three).to_param)
    
    # Verifica que não existem pontos turísticos cadastrados para tag 3
    get :index, :tag_id => tag3.id
    assert_response :success
		assert_not_nil assigns(:tourist_sights)
    assert_equal(0, assigns(:tourist_sights).length)
    
    # Verifica que existe 1 ponto turistico para tag 1
    get :index, :tag_id => tag1.id
    assert_response :success
		assert_not_nil assigns(:tourist_sights)
    assert_equal(1, assigns(:tourist_sights).length)
    
    # Verifica que existe 1 ponto turistico para tag 2
    get :index, :tag_id => tag2.id
    assert_response :success
		assert_not_nil assigns(:tourist_sights)
    assert_equal(1, assigns(:tourist_sights).length)
  end
  
end








