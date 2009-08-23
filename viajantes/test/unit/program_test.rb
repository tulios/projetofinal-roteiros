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

end
