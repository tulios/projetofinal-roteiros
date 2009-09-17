require 'test_helper'

class StateTest < ActiveSupport::TestCase
 
	test "Deveria retornar todos os estados" do
		assert_equal(State.count, State.load_all.length)
	end

  test "Deveria carregar o pais pela regiao" do
    states = State.load_all
    assert states
    assert states.length > 0
    
    state1 = states[0]
    
    puts state1.inspect
    
    assert_equal "Brasil", state1.country.name
  end

end
