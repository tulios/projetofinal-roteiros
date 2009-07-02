require 'test_helper'

class CityTest < ActiveSupport::TestCase
 
	test "Deveria retornar todas as cidades do estado informado" do
		state_id = states(:one).to_param
		assert_equal City.count, City.load_all(state_id).length
	end	

end
