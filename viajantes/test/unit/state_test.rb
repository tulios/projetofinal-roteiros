require 'test_helper'

class StateTest < ActiveSupport::TestCase
 
	test "Deveria retornar todos os estados" do
		assert_equal (State.count, State.load_all.length)
	end

end
