require 'test_helper'

class ShopsControllerTest < ActionController::TestCase
  test "Deveria carregar a listagem de estabelecimentos" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops)

    # Verifica se recuperou os 2 estabelecimentos inseridos pela fixture shops.yml
    assert_equal(2, assigns(:shops).length)
  end

  test "Deveria carregar a tela de cadastramento" do
    login_as :quentin

    get :new
    assert_response :success

    # Não podem ser nulos
    assert_not_nil assigns(:shop)
    assert_not_nil assigns(:states)
    # Deve carregar o estado adicionado a fixture states.yml
    assert_equal(2, assigns(:states).length)
  end

  test "Deveria criar um estabelecimento" do
    login_as :quentin
    
    # Verifica que so existe os shops criados pela fixture
		assert_equal(2, Shop.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { :name => "Shop-3", :address => "Endereco3", :city_id => "1" }
    post :create, :shop => conteudo
		assert_equal(3, Shop.count)

    assert_redirected_to shop_path(assigns(:shop))
  end

  test "Deveria falhar ao criar um estabelecimento" do
    login_as :quentin
    
    # Verifica que so existe os shops criados pela fixture
		assert_equal(2, Shop.count)

		# Verifica que o controlador não criou um novo e redirecionou para o lugar certo
    # Criei um Shop sem o nome.
		conteudo = { :address => "Endereco3", :city_id => "1" }
    post :create, :shop => conteudo

    assert_not_nil(assigns(:shop).errors)
    assert_equal(1, assigns(:shop).errors.length)

    assert_not_nil(assigns(:states))
    assert_not_nil(assigns(:cities))

    assert_equal(2, assigns(:states).length)
    assert_equal(1, assigns(:cities).length)

    # Não pode ter salvado
		assert_equal(2, Shop.count)
  end

  test "Deveria detalhar um estabelecimento" do
    get :show, :id => shops(:one).to_param
    assert_response :success

    assert_not_nil(assigns(:shop))
    assert_equal(shops(:one).to_param, "#{assigns(:shop).id}")
  end

  test "Deveria incrementar o numero de hits ao vizualizar" do
    id = shops(:one).to_param
    get :show, :id => id

    # Verifica que o hit foi incrementado
		assert_equal(1, assigns(:shop).hits)
		
		get :show, :id => id		    
		
		# Verifica que o hit foi incrementado
		assert_equal(2, assigns(:shop).hits)

  end

  test "Deveria editar um estabelecimento" do
    login_as :quentin
    
    get :edit, :id => shops(:one).to_param
    assert_response :success

    # Verifica que carregou o estabelecimento correto
    assert_not_nil(assigns(:shop))
    assert_equal(shops(:one).to_param, "#{assigns(:shop).id}")

    # Verifica que carregou os estatos
    assert_not_nil(assigns(:states))
    assert_equal(2, assigns(:states).length)

    # Verifica que carregou as cidades
    assert_not_nil(assigns(:cities))
    assert_equal(1, assigns(:cities).length)

    # Verifica que carregou os pontos turísticos
    assert_not_nil(assigns(:tourist_sights))
    assert_equal(2, assigns(:tourist_sights).length)
  end

  test "Deveria atualizar o estabelecimento" do
    login_as :quentin
    
    shop = Shop.find(shops(:one).to_param)
    assert_not_nil(shop)
    # Verifico que o nome não é igual o novo nome
    assert_not_equal(shop.name, "novo nome")

    # Altero o nome
    put :update, :id => shops(:one).to_param, :shop => {:name => "novo nome"}
    assert_redirected_to shop_path(assigns(:shop))

    # Verifico se alterou
    assert_equal("novo nome", assigns(:shop).name)
  end

  test "Deveria apagar um estabelecimento" do
    login_as :quentin
    
    # Verifica que so existe os shops criados pela fixture
		assert_equal(2, Shop.count)

		# Verifica que o controlador apagou e redirecionou para o lugar certo
    post :destroy, :id => shops(:one).to_param
    assert_redirected_to shops_path

		assert_equal(1, Shop.count)
  end
  
  test "Deveria filtrar os resultados pela cidade" do
  	# Verifica se o controlador respondeu sucesso
    get :index
    assert_response :success

		# Verifica que ele carregou os tourist_sights
    assert_not_nil assigns(:shops)
    assert_equal(2, assigns(:shops).length)
    
    # Verifica que não existem estebelecimentos cadastrados para fortaleza
    get :index, :state_id => 10, :city_id => 2
    assert_response :success
		assert_not_nil assigns(:shops)
    assert_equal(0, assigns(:shops).length)
    
    # Verifica que existem 2 estabelecimentos em brasilia
    get :index, :state_id => 20, :city_id => 1
    assert_response :success
		assert_not_nil assigns(:shops)
    assert_equal(2, assigns(:shops).length)
  end
end
