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
		assert_difference "Event.count" do
		  # Verifica que o controlador criou um novo e redirecionou para o lugar certo
		  conteudo = { :name => "Evento_3", :time => (Date.today + 1.day), :city_id => "1" }
      post :create, :event => conteudo

      assert_redirected_to event_path(assigns(:event))
		end
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
    put :update, :id => events(:one).to_param, :event => {:name => "novo nome", :time => (Date.today + 1.day)}
    assert_redirected_to event_path(assigns(:event))

    # Verifico se alterou
    assert_equal("novo nome", assigns(:event).name)
  end
  
  test "Não Deveria deixar outro usuário atualizar o evento" do
    # Faz o login com um usuário que não é o dono do objeto
    login_as :aaron
    
    event = Event.find(events(:one).to_param)
    assert_not_nil(event)
    # Verifico que o nome não é igual o novo nome
    assert_not_equal(event.name, "novo nome")

    # Tenta atualizar o evento
    put :update, :id => events(:one).to_param, :event => {:name => "novo nome"}
    assert_redirected_to event_path(assigns(:event))

    # Verifico que o evento não foi alterado
    assert_not_equal("novo nome", assigns(:event).name)
  end

  test "Deveria apagar um evento" do
    login_as :quentin
    
    assert_difference "Event.count", -1 do
      post :destroy, :id => events(:two).to_param  
      assert_redirected_to events_path
    end
  end
  
  test "Não deveria deixar apagar um evento" do
    # Faz o login com um usuário que não é o dono do objeto
    login_as :aaron
    
    assert_no_difference "Event.count" do
      post :destroy, :id => events(:one).to_param
      assert_redirected_to assigns(:event)
    end
  end
  
  test "Deveria filtrar os resultados pela cidade" do
  	# Verifica se o controlador respondeu sucesso
    get :index
    assert_response :success

		# Verifica que ele carregou os eventos
    assert_not_nil assigns(:events)
    assert_equal(2, assigns(:events).length)
    
    # Verifica que existe 1 evento cadastrado para fortaleza
    get :index, :state_id => 10, :city_id => 2
    assert_response :success
		assert_not_nil assigns(:events)
    assert_equal(1, assigns(:events).length)
    
    # Verifica que existe 1 evento em brasilia
    get :index, :state_id => 20, :city_id => 1
    assert_response :success
		assert_not_nil assigns(:events)
    assert_equal(1, assigns(:events).length)
  end
  
  test "Não deveria deixar carregar a tela new sem estar logado" do
    put :new
    assert_response 302
  end

  test "Não deveria deixar carregar a tela edit sem estar logado" do
    put :edit, :id => events(:one).to_param
    assert_response 302
  end
  
  test "Não deveria deixar fazer o create sem estar logado" do
    conteudo = { :name => "Evento_3", :time => Time.parse('2009-11-11'), :city_id => "1" }
    post :create, :event => conteudo

    assert_response 302
  end
  
  test "Não deveria deixar fazer o update sem estar logado" do
   put :update, :id => events(:one).to_param, :event => {:name => "novo nome"}
    assert_response 302
  end
  
  test "Não deveria deixar fazer o destroy sem estar logado" do
    post :destroy, :id => events(:one).to_param
    assert_response 302
  end   
  
  test "Deveria carregar os eventos da cidade do usuario caso ele esteja logado" do
    # Acessa a listagem sem estar logado
    get :index
    assert_response :success

		# Verifica que ele carregou os eventos
    assert_not_nil assigns(:events)  
    
    # loga com o quentin
    login_as :quentin   
    
    get :index
    assert_response :success

		# Verifica que ele carregou os eventos
    assert_not_nil assigns(:events)  
    # E preencheu cidade e estado com os dados do usuário
    assert_equal users(:quentin).city.state.id, assigns(:state_id)                       
    assert_equal users(:quentin).city.id, assigns(:city_id)
  end
  
end
