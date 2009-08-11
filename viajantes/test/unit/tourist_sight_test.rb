require 'test_helper'

class TouristSightTest < ActiveSupport::TestCase
	
	test "Deveria criar um tourist sight" do
		#verifica que um objeto vazio nao e valido
		ts = TouristSight.new
		assert (not ts.valid?)
		#verifica os erros lancados
		assert_invalidos(ts, [:name, :address, :city_id])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:name => "TS1", :address => "ADS1", :description => "desc1", :city => city}
		ts = TouristSight.new(conteudo)
		assert ts.valid?
		#verifica que nao lancou erros
		assert_validos(ts, [:name, :address, :city])
	end

	test "Deveria adicionar e remover tags" do
		# Gerando dados para o teste
		tags_adicionadas = []
		tags_adicionadas << Tag.find(tags(:one).to_param)
		tags_adicionadas << Tag.find(tags(:two).to_param)
		
		# Recuperando PontoTuristico da fixture	
		ts_id = tourist_sights(:one).to_param
		ts = TouristSight.find(ts_id)

		# Adicionando as 2 tags criadas ao PontoTuristico
		ts.save_tags(tags_adicionadas)
		ts = TouristSight.find(ts_id)
		assert_equal(2, ts.tags.length)

		# Adicionando +1 tag as 2 ja existentes
		tags_adicionadas << Tag.find(tags(:three).to_param)
		ts.save_tags(tags_adicionadas)
		ts = TouristSight.find(ts_id)
		assert_equal(3, ts.tags.length)

		# Removendo 1 tag das 3 existente
		tags_adicionadas.delete_at(0) # 1º elemento
		ts.save_tags(tags_adicionadas)
		ts = TouristSight.find(ts_id)
		assert_equal(2, ts.tags.length)
	end

  test "Deveria nao adicionar nenhuma tag e apagar as associacoes existentes" do
    # Gerando dados para o teste
		tags_adicionadas = []
		tags_adicionadas << Tag.find(tags(:one).to_param)
		tags_adicionadas << Tag.find(tags(:two).to_param)

		# Recuperando PontoTuristico da fixture
		ts_id = tourist_sights(:one).to_param
		ts = TouristSight.find(ts_id)

		# Adicionando as 2 tags criadas ao PontoTuristico
		ts.save_tags(tags_adicionadas)
		ts = TouristSight.find(ts_id)
		assert_equal(2, ts.tags.length)

    # Retira todas as tags e salva
    tags_adicionadas = []
    ts.save_tags(tags_adicionadas)
		ts = TouristSight.find(ts_id)
		assert_equal(0, ts.tags.length)
  end

	test "Deveria recuperar todos os TouristSights da mesma cidade que tenham uma tag especifica associada" do
		ts1 = TouristSight.find(tourist_sights(:one).to_param)
		TouristSight.find(tourist_sights(:two).to_param)
		
		city_id = ts1.city.id		

		tag = Tag.find(tags(:one).to_param)
		array = TouristSight.find_all_by_city_and_tag(city_id, tag.id)
		assert_not_nil(array)
		assert_equal(0, array.length)
	end
	
	test "Deveria recuperar um tourist_sight com as suas dicas" do
		ts1 = TouristSight.find(tourist_sights(:one).to_param)
	
		assert(ts1.valid?)
		assert_not_nil(ts1.tips)
		assert_equal(1, ts1.tips.length);
	end
	
	test "Deveria incrementar o valor de hits" do
	  ts1 = TouristSight.find(tourist_sights(:one).to_param)
	  assert_equal(0, ts1.hits)
	  
	  ts1.increase_hits
	  assert_equal(1, ts1.hits)
	  
	  ts1 = TouristSight.find(ts1.id)
	  assert_equal(1, ts1.hits)
	end

	test "Deveria carregar apenas 10 dicas consigo" do
		ts = TouristSight.find(tourist_sights(:one).to_param)
		# Cria 20 dicas para o ponto turistico
		(1..20).each do |number|
			tip = Tip.new({:name => "Tips#{number}", :description => "Desc#{number}", :tourist_sight => ts})
			tip.save
		end

		ts = TouristSight.find(ts.id)
		assert_not_nil(ts)

    assert(Tip.count >= 20, "quantidade na base #{Tip.count} deveria ser >= 20")
		assert_equal(10, ts.tips.length)
	end

end



















