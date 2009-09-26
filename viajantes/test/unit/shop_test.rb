require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  test "Deveria criar um estabelecimento" do
		#verifica que um objeto vazio nao e valido
		shop = Shop.new
		assert (not shop.valid?)
		#verifica os erros lancados
		assert_invalidos(shop, [:name, :address, :city_id])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:name => "SHOP1", :address => "ADS1", :description => "desc1", :city => city}
		shop = Shop.new(conteudo)
		assert shop.valid?
		#verifica que nao lancou erros
		assert_validos(shop, [:name, :address, :city])
	end

  test "Deveria encontrar os estabelecimentos pelo nome ou palavra-chave" do
    # Primeiro, verificando a pesquisa pelo nome
    shops = Shop.find_like_name_or_key_word("1", 5, 1)
    assert_not_nil(shops)
    assert_equal(1, shops.length)
    assert_equal("Shop-1", shops[0].name)

    shops = Shop.find_like_name_or_key_word("2", 5, 1)
    assert_not_nil(shops)
    assert_equal(1, shops.length)
    assert_equal("Shop-2", shops[0].name)

    shops = Shop.find_like_name_or_key_word("sHoP", 5, 1)
    assert_not_nil(shops)
    assert_equal(2, shops.length)

    shops = Shop.find_like_name_or_key_word("palavra_nao_existente", 5, 1)
    assert_not_nil(shops)
    assert_equal(0, shops.length)

    # Verificando a pesquisa pelas palavras-chave
    shops = Shop.find_like_name_or_key_word("bAr", 5, 1)
    assert_not_nil(shops)
    assert_equal(1, shops.length)
    assert_equal("Shop-1", shops[0].name)

    shops = Shop.find_like_name_or_key_word("rEsTaUrAnTe", 5, 1)
    assert_not_nil(shops)
    assert_equal(1, shops.length)
    assert_equal("Shop-2", shops[0].name)

    shops = Shop.find_like_name_or_key_word("palavra_nao_existente", 5, 1)
    assert_not_nil(shops)
    assert_equal(0, shops.length)
  end
  
  test "Deveria incrementar o valor de hits" do
	  shop1 = Shop.find(shops(:one).to_param)
	  assert_equal(0, shop1.hits)
	  
	  shop1.increase_hits
	  assert_equal(1, shop1.hits)
	  
	  shop1 = Shop.find(shop1.id)
	  assert_equal(1, shop1.hits)
	end
	
	test "Deveria verificar se uma avaliacao ja foi feita essa semana"
	  # Preparando teste
	  ev = Evaluation.new(:general => "1", :clean => "3", :evaluation => {:criticism => "Criticism"})
	  ev.save
	  
    se = ShopEvaluation.new(:shop_id => 1, :evaluation_id => ev.id)
    se.save
    
    
  end 
end




























