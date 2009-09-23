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

	test "Deveria carregar apenas 5 dicas consigo" do
		ts = TouristSight.find(tourist_sights(:one).to_param)
		# Cria 20 dicas para o ponto turistico
		(1..20).each do |number|
			tip = Tip.new({
				:name => "Tips#{number}", 
				:description => "Desc#{number}", 
				:user_id => users(:quentin).to_param
			})
			tip.save
			
			tourist_sight_tip = TouristSightTip.new(:tourist_sight => ts, :tip => tip)
			tourist_sight_tip.save
		end

		ts = TouristSight.find(ts.id)
		assert_not_nil(ts)

    assert(Tip.count >= 20, "quantidade na base de Tips #{Tip.count} deveria ser >= 20")
    assert(TouristSightTip.count >= 20, "quantidade na base de TouristSightTips 
      #{Tip.count} deveria ser >= 20")
      
		assert_equal(5, ts.tips.length)
	end

	test "Deveria pesquisar pelo nome usando like" do
		results = TouristSight.find_like_name("PontoTuris")
		assert_not_nil(results)
		assert_equal(2, results.length)

		results = TouristSight.find_like_name("PontoTuristo1")
		assert_not_nil(results)
		assert_equal(1, results.length)
	end
	
	test "Deveria trazer todos os registros caso o tourist_sight passado seja nulo ou nao exista" do
		ts = TouristSight.find_by_object
		assert_not_nil(ts)
		assert_equal(TouristSight.count, ts.length)
	end
	
	test "Deveria trazer todos os registros da cidade do objeto passado" do
		brasilia_id = cities(:one).to_param
		city = City.find(brasilia_id)
		
		object = TouristSight.new(:city => city)

		# Verifica se encontrou os pontos turisticos de brasilia
		ts = TouristSight.find_by_object(:search => object)
		assert_not_nil(ts)
		assert_equal(2, ts.length)
		
		fortaleza_id = cities(:two).to_param
		city = City.find(fortaleza_id)
		
		object = TouristSight.new(:city => city)

		# Verifica se encontrou os pontos turisticos de fortaleza
		ts = TouristSight.find_by_object(:search => object)
		assert_not_nil(ts)
		assert_equal(0, ts.length)
	end
	
	test "Deveria trazer todos os registros da cidade e da tag do objeto passado" do
		# - Preparando teste
		# Recuperando tags
		tags_adicionadas = []
		tags_adicionadas << Tag.find(tags(:one).to_param)
		tags_adicionadas << Tag.find(tags(:two).to_param)
		
		# Associando a um ponto turistico
		ts1 = TouristSight.find(tourist_sights(:one).to_param)
		ts1.save_tags(tags_adicionadas)
		# Verificando se salvou
		ts1 = TouristSight.find(ts1.id)
		assert_equal(2, ts1.tags.length)
		
		brasilia_id = cities(:one).to_param
		city = City.find(brasilia_id)
		# - fim preparacao
		
		# Criando objeto com a cidade e as tags
		object = TouristSight.new(:city => city, :tags => tags_adicionadas)

		# Verifica se encontrou os pontos turisticos de brasilia com as tags 1 e 2
		ts = TouristSight.find_by_object(:search => object)
		assert_not_nil(ts)
		assert_equal(1, ts.length)
		
		fortaleza_id = cities(:two).to_param
		city = City.find(fortaleza_id)
		
		object = TouristSight.new(:city => city, :tags => tags_adicionadas)

		# Verifica se encontrou os pontos turisticos de fortaleza com as tags 1 e 2
		ts = TouristSight.find_by_object(:search => object)
		assert_not_nil(ts)
		assert_equal(0, ts.length)
	end
	
	test "Deveria trazer todos os registros do usuario do objeto passado" do
		# Pesquisando pontos turisticos criados pelo quentin
		quentin = User.find(users(:quentin).to_param)
		object = TouristSight.new(:user => quentin)
		
		ts = TouristSight.find_by_object(:search => object)
		assert_not_nil(ts)
		assert_equal(2, ts.length)

		# Pesquisando pontos turisticos criados pelo aaron		
		aaron = User.find(users(:aaron).to_param)
		object = TouristSight.new(:user => aaron)
		
		ts = TouristSight.find_by_object(:search => object)
		assert_not_nil(ts)
		assert_equal(0, ts.length)
	end

end




















