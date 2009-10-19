require 'test_helper'

class ProgramTest < ActiveSupport::TestCase

  test "Deveria criar um program" do
		#verifica que um objeto vazio nao e valido
		pm = Program.new
		assert (not pm.valid?)
		#verifica os erros lancados
		assert_invalidos(pm, [:date, :destination_id])
		assert_equal(0, pm.value) # zero eh o valor default

		destination_id = destinations(:one).to_param
		destination = Destination.find(destination_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:date=> "2009-08-31", :destination => destination, :value => 100.50}
		pm = Program.new(conteudo)
		assert pm.valid?
		assert_equal(100.50, pm.value)

		#verifica que nao lancou erros
		assert_validos(pm, [:date, :destination_id])
	end

	test "Deveria retornar um happens_in diferente dependendo da associacao com tourist_sight ou shop" do
		program = Program.new
		assert_equal(:another, program.happens_in)
		
		program.tourist_sight = TouristSight.new
		assert_equal(:tourist_sight, program.happens_in)
		
		program.tourist_sight = nil
		program.shop = Shop.new
		assert_equal(:shop, program.happens_in)
	end
	   
	test "Nao deveria salvar com a data menor que a data de inicio do destino" do
	  d = create_destination({:start_date => Date.today + 2.day,
                                              :end_date => Date.today + 3.day})
                                              
    p = create_program({:destination => d, :date => Date.today + 1.day})
                            
    assert p.errors.on(:date)                             
  end
   
  test "Nao deveria salvar com a data maior que a data fim do destino" do
	  d = create_destination({:start_date => Date.today + 2.day,
                            :end_date => Date.today + 3.day})
                                              
    p = create_program({:destination => d, :date => Date.today + 4.day})
                            
    assert p.errors.on(:date)                             
  end

end
