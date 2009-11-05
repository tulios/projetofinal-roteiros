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
    
    destination_hash = { :city_id => cities(:two),
                        :vehicle => vehicles(:two),
                        :start_date => Date.new(2010,10,10),
                        :end_date => Date.new(2010,10,20),
                        :planned_cost => 200.0
                      }
    
    destination.update_attributes(destination_hash)
    assert destination.errors.empty?, destination.errors.full_messages.to_sentence
  end
  
  test "Deveria remover um destino" do

    assert_difference 'Destination.count', -1 do
      destination = destinations(:one)
      destination.destroy
    end
  end

  test "Deveria validar a presença de roadmap e city" do
    assert_no_difference 'Destination.count' do
      d = create_destination({:roadmap => nil, :city_id => nil})
      assert d.errors.on(:roadmap)
      assert d.errors.on(:city_id)
    end
  end
  
  test "Deveria validar a presença de start_date e end_date" do
    assert_no_difference 'Destination.count' do
      d = create_destination({:start_date => nil})
      assert d.errors.on(:start_date)
      
      d = create_destination({:end_date => nil})
      assert d.errors.on(:end_date)
    end
  end
  
  test "Deveria validar start_date sendo antes que end_date" do
    assert_no_difference 'Destination.count' do
      d = create_destination({:start_date => Date.new(2009,12,10), 
                              :end_date => Date.new(2009,10,10)})
      assert d.errors.on(:end_date)
    end
  end
  
  test "Deveria testar o numero de dias" do
    d = create_destination({:start_date => Date.new(2009,10,20),
                            :end_date => Date.new(2009,10,25)})
    
    assert_equal(5, d.number_of_days)
  end
  
  test "Deveria testar o valor total do destino" do
    destination = destinations(:one)
    
    sum = 0.0
    
    destination.programs.each do |program|
      sum += program.value
    end
    
    assert_equal(sum,destinations(:one).total)
  end
  
  test "Deveria testar o valor do balanco" do
    d = create_destination({:planned_cost => 100})
    assert_equal(d.planned_cost - d.total, d.balance);
  end     
  
  test "Nao deveria salvar com a data de hoje maior que o start_date" do
    d = create_destination({:start_date => Date.today - 1.day,
                            :end_date => Date.today + 2.day})
                            
    assert d.errors.on(:start_date)                             
  end
  
  test "Nao deveria salvar com start_date em um periodo maior que 10 anos" do
    d = create_destination({:start_date => Date.today + 1.day + 11.years,
                            :end_date => Date.today + 2.day + 11.years})
                            
    assert d.errors.on(:start_date)                             
  end  
  
  test "Nao deveria salvar com end_date em um periodo maior que 10 anos" do
    d = create_destination({:start_date => Date.today + 1.day,
                            :end_date => Date.today + 2.day + 11.years})
                            
    assert d.errors.on(:end_date)                             
  end
  
end
