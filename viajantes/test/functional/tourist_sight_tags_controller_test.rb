require 'test_helper'

class TouristSightTagsControllerTest < ActionController::TestCase

	test "Deveria carregar o new" do
		id = tourist_sights(:one).to_param
		
		# Verifica se o controlador responde sucesso passando o ID
		get :new, :tourist_sight_id => id
    assert_response :success

		# Verifica se o tourist_sight e as tags foram recuperadas
		assert_not_nil assigns(:tourist_sight)
		assert_equal(Tag.count, assigns(:tags).length)
	end	
	
	test "Deveria associar varias tags a um tourist sight" do
		# Verifica que o tourist_sight do teste nao possui tags
		ts = TouristSight.find(tourist_sights(:one).to_param)
		assert_equal(0, ts.tags.length)
		
		# Verifica se o controlador responde corretamente caso os dados sejam informados
		post :create, :tag => { :id => [1, 2]}, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
		
		# Verifica se o tourist_sight utilizado recebeu as tags
		ts = TouristSight.find(tourist_sights(:one).to_param)
		assert_equal(2, ts.tags.length)

		# Removendo uma das tags salvas
		post :create, :tag => { :id => [1]}, :tourist_sight_id => ts.id
		assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
		
		# Verifica que o tourist_sight utilizado ficou com apenas uma tag
		ts = TouristSight.find(tourist_sights(:one).to_param)
		assert_equal(1, ts.tags.length)
	end

end















