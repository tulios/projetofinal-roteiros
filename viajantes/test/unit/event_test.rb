require 'test_helper'

class EventTest < ActiveSupport::TestCase

	test "Deveria criar um event" do
		#verifica que um objeto vazio nao e valido
		event = Event.new
		assert (not event.valid?)
		#verifica os erros lancados O que é obrigatorio
		assert_invalidos(event, [:name, :city_id, :date])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:name => "Event1", :date => "2009-08-15", :city => city}
		event = Event.new(conteudo)
		assert event.valid?
		#verifica que nao lancou erros
		assert_validos(event, [:name, :city, :date])
	end
	
	test "Deveria retornar um happens_in diferente dependendo da associacao com tourist_sight ou shop" do
		event = Event.new
		assert_equal(:another, event.happens_in)
		
		event.tourist_sight = TouristSight.new
		assert_equal(:tourist_sight, event.happens_in)
		
		event.tourist_sight = nil
		event.shop = Shop.new
		assert_equal(:shop, event.happens_in)
	end

end
