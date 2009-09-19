require 'test_helper'

class EventTest < ActiveSupport::TestCase

	test "Deveria criar um event" do
		#verifica que um objeto vazio nao e valido
		event = Event.new
		assert (not event.valid?)
		#verifica os erros lancados
		assert_invalidos(event, [:name, :city_id, :time])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido

		#cria mais um objeto e verifica se no final existe um objeto a mais do que no inicio
		assert_difference 'Event.count' do
      event = create_event
			assert_validos(event, [:name, :time, :city])
      assert (not event.new_record?), "#{event.errors.full_messages.to_sentence}"
    end
	end

	  test "Deveria atualizar um event" do
    event = create_event
    
    eventHash = { 			:city_id => cities(:two),
                        :name => 'evento_4',
												:time => Time.parse('2009-11-10'),
                      }
    
    event.update_attributes(eventHash)
    assert event.errors.empty?, event.errors.full_messages.to_sentence
  end
  
  test "Deveria remover um event" do

    assert_difference 'Event.count', -1 do
      event = events(:one)
      event.destroy
    end
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

	def create_event(options = {})
    eventHash = {       :city_id => cities(:one),
                        :name => 'evento_3',
												:time => Time.parse('2009-10-10'),
                      }
    event = Event.new(eventHash.merge(options))
    event.save
    event
  end
  
  test "Deveria recuperar os eventos com o nome parecido ao pesquisado" do
    value = "evento"
    events = Event.find_like_name(value);
    assert events
    assert_equal events.size, Event.count
    
    events.each do |event|
      assert Regexp.new(value, Regexp::IGNORECASE).match(event.name)
    end
    
  end
	

end
