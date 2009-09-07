require 'test_helper'

class EventTest < ActiveSupport::TestCase

	test "Deveria criar um event" do
		#verifica que um objeto vazio nao e valido
		event = Event.new
		assert (not event.valid?)
		#verifica os erros lancados
		assert_invalidos(event, [:title, :city_id])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:title => "Roadmap1", :description => "desc1", :city => city}
		rm = Roadmap.new(conteudo)
		assert rm.valid?
		#verifica que nao lancou erros
		assert_validos(rm, [:title, :city])
	end
	
	
	test "Deveria retornar um happens_in diferente dependendo da associacao com tourist_sight ou shop" do
		event = Event.new
		assert_equal(:another, program.happens_in)
		
		event.tourist_sight = TouristSight.new
		assert_equal(:tourist_sight, event.happens_in)
		
		event.tourist_sight = nil
		event.shop = Shop.new
		assert_equal(:shop, event.happens_in)
	end

end
