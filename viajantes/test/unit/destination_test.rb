require 'test_helper'

class DestinationTest < ActiveSupport::TestCase

  test "Deveria criar um destino" do
    assert_difference 'Destination.count' do
      destination = create_destination
      assert (not destination.new_record?), "#{destination.errors.full_messages.to_sentence}"
    end
  end
  
  test "Deveria atualizar um destino" do
    destination = create_destination
    
    destinationHash = { :city_id => cities(:two),
                        :vehicle => vehicles(:two),
                        :start_date => Date.new(2010,10,10),
                        :end_date => Date.new(2010,10,20),
                        :planned_cost => 200.0
                      }
    
    destination.update_attributes(destinationHash)
    assert destination.errors.empty?, destination.errors.full_messages.to_sentence
  end
  
  test "Deveria remover um destino" do
    num_destinations = Destination.count
    
    destination = destinations(:one)
    destination.destroy
    
    assert_equal(Destination.count, (num_destinations - 1))
  end

  test "Deveria validar a presença de roadmap e city" do
    assert_no_difference 'Destination.count' do
      d = create_destination({:roadmap => nil, :city => nil})
      assert d.errors.on(:roadmap, :city)
    end
  end

  # Protected Methods
  protected
  
  def create_destination(options = {})
    destinationHash = { :roadmap => roadmaps(:one),
                        :city_id => cities(:one),
                        :vehicle => vehicles(:one),
                        :start_date => Date.new(2009,10,10),
                        :end_date => Date.new(2009,10,20),
                        :planned_cost => 100.0
                      }
    destination = Destination.new(destinationHash.merge(options))
    destination.save
    destination
  end
  
end
