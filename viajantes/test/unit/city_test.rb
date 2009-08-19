require 'test_helper'

class CityTest < ActiveSupport::TestCase
 
	test "Deveria retornar todas as cidades do estado informado" do
		state_id = states(:one).to_param
		assert_equal City.find_all_by_state_id(state_id).length, City.load_all(state_id).length
	end	

end
