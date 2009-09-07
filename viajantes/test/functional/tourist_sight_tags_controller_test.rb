require 'test_helper'

class TouristSightTagsControllerTest < ActionController::TestCase

	test "Deveria carregar o new" do
    login_as :quentin
    
		id = tourist_sights(:one).to_param
		
		# Verifica se o controlador responde sucesso passando o ID
		get :new, :tourist_sight_id => id
    assert_response :success

		# Verifica se o tourist_sight e as tags foram recuperadas
		assert_not_nil assigns(:tourist_sight)
		assert_equal(Tag.count, assigns(:tags).length)
	end	
	
	test "Deveria associar varias tags a um tourist sight" do
    login_as :quentin

    ts = TouristSight.new(:name => "TS1",
                          :address => "address",
                          :city_id => 1,
                          :user_id => 1)
    assert(ts.save)

		# Verifica que o tourist_sight do teste nao possui tags
		assert_equal(0, ts.tags.length)
		
		# Verifica se o controlador responde corretamente caso os dados sejam informados
		post :create, :tag => { :id => [1, 2]}, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
		
		# Verifica se o tourist_sight utilizado recebeu as tags
    ts = TouristSight.find(ts.id);
		assert_equal(2, ts.tags.length)

		# Removendo uma das tags salvas
		post :create, :tag => { :id => [1]}, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
		
		# Verifica que o tourist_sight utilizado ficou com apenas uma tag
    ts = TouristSight.find(ts.id);
		assert_equal(1, ts.tags.length)
	end

	test "Deveria listar todos os tourist sights da cidade informada com a tag informada" do
		# Preparando teste
		id = tourist_sights(:one).to_param
		tag_id = tags(:one).to_param

		# Recuperando objetos do banco
		tag = Tag.find(tag_id)
		ts = TouristSight.find(id)
		
		# Associando tag a tourist sight
		ts.save_tags([tag])

		# Verifica se o controlador responde sucesso
		get :index, :tourist_sight_id => id, :tag_id => tag.id
    assert_response :success
	
		# Verifica se o controlador recuperou o objeto
		assert_equal(1, assigns(:tourist_sights).length)
		assert_not_nil assigns(:city)
		assert_not_nil assigns(:tag)
	end

  test "Deveria nao adicionar nenhuma tag e apagar as associacoes existentes" do
    login_as :quentin

    ts = TouristSight.new(:name => "TS1",
                          :address => "address",
                          :city_id => 1,
                          :user_id => 1)
    assert(ts.save)

		# Verifica que o tourist_sight do teste nao possui tags		
		assert_equal(0, ts.tags.length)

		# Verifica se o controlador responde corretamente caso os dados sejam informados
		post :create, :tag => { :id => [1, 2]}, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))

		# Verifica se o tourist_sight utilizado recebeu as tags
		ts = TouristSight.find(ts.id)
		assert_equal(2, ts.tags.length)

		# Removendo todas as tags, passando id = nil
		post :create, :tag => { :id => nil}, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))

		# Verifica que o tourist_sight utilizado ficou com apenas uma tag
		ts = TouristSight.find(ts.id)
		assert_equal(0, ts.tags.length)

    # Removendo todas as tags, passando tag = nil
		post :create, :tag => nil, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))

		# Verifica que o tourist_sight utilizado ficou com apenas uma tag
		ts = TouristSight.find(ts.id)
		assert_equal(0, ts.tags.length)
  end

end
















