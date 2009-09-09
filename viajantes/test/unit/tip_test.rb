require 'test_helper'

class TipTest < ActiveSupport::TestCase

	test "Deveria criar uma dica" do
    assert_difference "Tip.count" do
      tip = create_tip
      assert (not tip.new_record?), "#{tip.errors.full_messages.to_sentence}"
    end
	end
	
	test "Deveria alterar os dados de uma dica" do
    tip = create_tip
    update_tip(tip)
    assert tip.errors.empty?, tip.errors.full_messages.to_sentence
	end
	
	test "Deveria remover uma dica" do 
		assert_difference 'Tip.count', -1 do
      tip = tips(:one)
      tip.destroy
    end		
	end
	
	test "Deveria validar a presença de name, description e user" do
	  assert_no_difference 'Tip.count' do
	    tip = create_tip({:name => nil, :description => nil, :user => nil})
	    assert tip.errors.on(:name)
	    assert tip.errors.on(:description)
	    assert tip.errors.on(:user)
	  end
	end
	
	test "Deveria validar o tamanho de name" do
	  assert_no_difference 'Tip.count' do
	    tip = create_tip({:name => "test"}) # name com apenas 4 letras
	    assert tip.errors.on(:name)
	  end
	end
	
	# Métodos protegidos
	protected
	
	def create_tip(options = {})
    tip_hash = { :name => "NomeDaDica",
                 :description => "DescricaoDaDica",
                 :user => users(:quentin),
               }
               
    tip = Tip.new(tip_hash.merge(options))
    tip.save
    tip
  end
  
  def update_tip(tip, options = {})
    tip_hash = { :name => "NomeDaDica2",
                 :description => "DescricaoDaDica2",
                 :user => users(:aaron),
               }
               
    tip = tip.update_attributes(tip_hash.merge(options))
  end

end
