require 'test_helper'

class TipTest < ActiveSupport::TestCase

	test "Deveria criar uma dica para um ponto turístico" do

		#verifica as validações da dica		
		tip = Tip.new
		assert (not tip.valid?)
		
		#verifica se os atributos estao sendo validados
		assert_invalidos(tip, [:name, :description, :tourist_sight])
		
		#recupera um ponto turistico
		ts_id = tourist_sights(:one).to_param
		ts = TouristSight.find(ts_id)
		
		#instancia uma nova dica com atributos válidos
		tip = Tip.new({:name => "Tip1", :description => "Desc1", :tourist_sight => ts})

		assert_validos(tip, [:name, :description, :tourist_sight])
	end
	
	test "Deveria alterar os dados de uma dica" do

		NOVO_NOME = "Novo nome"
		NOVA_DESCRICAO = "Nova descricao"

		#recupera a dica da fixture
		tip = tips(:one)
		
		#verifica que o objeto da fixture é valido
		assert_validos(tip, [:name, :description, :tourist_sight])

		#recupera o segundo tourist sight
		ts2 = tourist_sights(:two)
		
		#seta os atributos e salva
		tip.name = "Novo nome"
		tip.description = "Nova descricao"
		tip.tourist_sight = ts2
		tip.save
		
		#recupera a dica salva e verifica que o objeto é valido
		tip = Tip.find(tip.id)
		assert_validos(tip, [:name, :description, :tourist_sight])
		
		assert_equal(tip.name, NOVO_NOME);
		assert_equal(tip.description, NOVA_DESCRICAO);
		assert_equal(tip.tourist_sight.id, 2);
	end
	
	test "Deveria remover uma dica" do 
		
		#recupera a dica da fixture
		tip = Tip.find(tips(:one).to_param)
		assert(tip.valid?)
	
		tip_id = tip.id
		
		#remove a dica
		tip.destroy
		
		begin
			tip = Tip.find(tip_id)
			fail("Recuperou mas não deveria.")
		rescue ActiveRecord::RecordNotFound => e
			#ok
		end
		
	end

end
