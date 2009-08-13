require 'test_helper'

class RoadmapTest < ActiveSupport::TestCase
  
	test "Deveria criar um roadmap" do
		#verifica que um objeto vazio nao e valido
		rm = Roadmap.new
		assert (not rm.valid?)
		#verifica os erros lancados
		assert_invalidos(rm, [:title, :city_id])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:title => "Roadmap1", :description => "desc1", :city => city}
		rm = Roadmap.new(conteudo)
		assert rm.valid?
		#verifica que nao lancou erros
		assert_validos(rm, [:title, :city])
	end

end
