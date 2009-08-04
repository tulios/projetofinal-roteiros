require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  
  test "Deveria carregar as cidades do estado informado" do
		# Verifica se o controlador respondeu sucesso
		state_id = states(:one).to_param
		get :index, :state_id => state_id
		assert_response :success

		# Verifica se recuperou a unica cidade inserida pela fixture cities.yml
		assert_equal(1, assigns(:cities).length)
	end

end
