require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase

  test "Deveria carregar o new" do
    login_as :quentin

    get :new, :roadmap_id => 1, :destination_id => 1
    assert_response :success
		assert_not_nil assigns(:program)
		assert_not_nil assigns(:roadmap)
    assert_not_nil assigns(:destination)
    assert_not_nil assigns(:tourist_sights)    
    assert_not_nil assigns(:shops)    
  end

  test "Deveria criar um program" do
    login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(3, Program.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { :date => "21/08/2009", :value => "R$ 100,50"}
    post :create, :program => conteudo, :destination_id => 1
		assert_equal(4, Program.count)

    assert_redirected_to assigns(:program).destination.roadmap
    assert_nil(assigns(:program).tourist_sight)
    assert_nil(assigns(:program).shop)    
  end
  
  test "Deveria criar um program associado a tourist_sight" do
    login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(3, Program.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { 
			:date => "21/08/2009", :value => "R$ 100,50", 
			:happens_in => "tourist_sight", :tourist_sight_id => 1
		}
    post :create, :program => conteudo, :destination_id => 1
		assert_equal(4, Program.count)

    assert_redirected_to assigns(:program).destination.roadmap
    assert_not_nil(assigns(:program).tourist_sight)
    assert_nil(assigns(:program).shop)    
  end
  
  test "Deveria criar um program associado a shop" do
    login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(3, Program.count)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
		conteudo = { 
			:date => "21/08/2009", :value => "R$ 100,50", 
			:happens_in => "shop", :shop_id => 1
		}
    post :create, :program => conteudo, :destination_id => 1
		assert_equal(4, Program.count)

    assert_redirected_to assigns(:program).destination.roadmap
    assert_nil(assigns(:program).tourist_sight)
    assert_not_nil(assigns(:program).shop)    
  end

  test "Deveria carregar o editar de program" do
		login_as :quentin
    get :edit, :id => programs(:one).to_param
    assert_response :success

		assert_not_nil assigns(:program)
		assert_not_nil assigns(:destination)
		assert_not_nil assigns(:roadmap)
    assert_not_nil assigns(:tourist_sights)    
    assert_not_nil assigns(:shops)    
  end

  test "Deveria atualizar um program" do
		login_as :quentin

		id = programs(:one).to_param
		pm = Program.find(id)
		dados_a_atualizar = { :description => "Nova description", 
													:date => "23/08/2009", 
													:destination => pm.destination,
													:value => "R$ 100.50"}		

		# Verifica que o obj nao possuia o valor a ser atualizado
		assert_not_equal("Nova description", pm.description)

		# Verifica se o controlador redirecionou para o lugar correto
    put :update, :id => id, :program => dados_a_atualizar
    assert_redirected_to roadmap_path(assigns(:roadmap))
	
		# Verifica se o valor foi alterado
		pm = Program.find(id)
		assert_equal("Nova description", pm.description)
		assert_nil(pm.tourist_sight)
		assert_nil(pm.shop)
  end
  
  test "Deveria atualizar um program associando a tourist_sight" do
		login_as :quentin

		id = programs(:one).to_param
		pm = Program.find(id)
		dados_a_atualizar = { :description => "Nova description", 
													:date => "23/08/2009", 
													:destination => pm.destination,
													:value => "R$ 100.50",
													:happens_in => "tourist_sight",
													:tourist_sight_id => 1}		

		# Verifica que o obj nao possuia o valor a ser atualizado
		assert_not_equal("Nova description", pm.description)

		# Verifica se o controlador redirecionou para o lugar correto
    put :update, :id => id, :program => dados_a_atualizar
    assert_redirected_to roadmap_path(assigns(:roadmap))
	
		# Verifica se o valor foi alterado
		pm = Program.find(id)
		assert_equal("Nova description", pm.description)
		assert_not_nil(pm.tourist_sight)
		assert_equal(1, pm.tourist_sight.id)
		assert_nil(pm.shop)
  end

	test "Deveria atualizar um program associando a shop" do
		login_as :quentin

		id = programs(:one).to_param
		pm = Program.find(id)
		dados_a_atualizar = { :description => "Nova description", 
													:date => "23/08/2009", 
													:destination => pm.destination,
													:value => "R$ 100.50",
													:happens_in => "shop",
													:shop_id => 1}		

		# Verifica que o obj nao possuia o valor a ser atualizado
		assert_not_equal("Nova description", pm.description)

		# Verifica se o controlador redirecionou para o lugar correto
    put :update, :id => id, :program => dados_a_atualizar
    assert_redirected_to roadmap_path(assigns(:roadmap))
	
		# Verifica se o valor foi alterado
		pm = Program.find(id)
		assert_equal("Nova description", pm.description)
		assert_nil(pm.tourist_sight)
		assert_not_nil(pm.shop)
		assert_equal(1, pm.shop.id)
  end

  test "Deveria apagar um program" do
		login_as :quentin
    
		# Veririca a quantidade de objetos antes da exclusao
		assert_equal(3, Program.count)

		# Verifica se o controlador redirecionou para o lugar correto
		id = programs(:one).to_param
		roadmap = Program.find(id).destination.roadmap

    delete :destroy, :id => id
    assert_redirected_to roadmap_path(roadmap)

		# Verifica a quantidade apos a exclusao
		assert_equal(2, Program.count)
  end
end










