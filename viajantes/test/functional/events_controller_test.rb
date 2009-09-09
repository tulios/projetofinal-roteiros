require 'test_helper'

class EventsControllerTest < ActionController::TestCase
	
	test "Deveria carregar a listagem de eventos" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)

    # Verifica se recuperou os 2 estabelecimentos inseridos pela fixture events.yml
    assert_equal(2, assigns(:events).length)
  end  

	  test "Deveria carregar a tela de cadastramento" do
    login_as :quentin

    get :new
    assert_response :success

    # Não podem ser nulos
    assert_not_nil assigns(:event)
    assert_not_nil assigns(:states)
    # Deve carregar o estado adicionado a fixture states.yml
    assert_equal(2, assigns(:states).length)
  end

  test "Deveria criar um evento" do
    login_as :quentin
    
    # Verifica que so existe os eventos criados pela fixture
		assert_equal(2, Event.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { :name => "Evento_3", :time => Time.parse('2009-11-10'), :city_id => "1" }
    post :create, :event => conteudo
		assert_equal(3, Event.count)

    assert_redirected_to event_path(assigns(:event))
  end

  test "Deveria detalhar um evento" do
    get :show, :id => events(:one).to_param
    assert_response :success

    assert_not_nil(assigns(:event))
    assert_equal(events(:one).to_param, "#{assigns(:event).id}")
  end
 
  test "Deveria editar um evento" do
    login_as :quentin
    
    get :edit, :id => events(:one).to_param
    assert_response :success

    # Verifica que carregou o evento correto
    assert_not_nil(assigns(:event))
    assert_equal(events(:one).to_param, "#{assigns(:event).id}")

    # Verifica que carregou os estatos
    assert_not_nil(assigns(:states))
    assert_equal(2, assigns(:states).length)

    # Verifica que carregou as cidades
    assert_not_nil(assigns(:cities))
    assert_equal(1, assigns(:cities).length)

  end

	test "Deveria atualizar o evento" do
    login_as :quentin
    
    event = Event.find(events(:one).to_param)
    assert_not_nil(event)
    # Verifico que o nome não é igual o novo nome
    assert_not_equal(event.name, "novo nome")

    # Altero o nome
    put :update, :id => events(:one).to_param, :event => {:name => "novo nome"}
    assert_redirected_to event_path(assigns(:event))

    # Verifico se alterou
    assert_equal("novo nome", assigns(:event).name)
  end

  test "Deveria apagar um evento" do
    login_as :quentin
    
    # Verifica que so existe os eventos criados pela fixture
		assert_equal(2, Event.count)

		# Verifica que o controlador apagou e redirecionou para o lugar certo
    post :destroy, :id => events(:one).to_param
    assert_redirected_to events_path

		assert_equal(1, Event.count)
  end
end
