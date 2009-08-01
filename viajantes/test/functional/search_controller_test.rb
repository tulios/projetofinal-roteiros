require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "Cria 21 estabelecimentos e 21 pontos turisticos" do
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		for x in (0..51)
			conteudo = {:name => "ACHE_TS#{x}", :address => "ADS#{x}", :description => "desc#{x}", :city => city}
			ts = TouristSight.new(conteudo)
			ts.save
		end

		for x in (0..51)
			conteudo = {:name => "ACHE_SHOP#{x}", :address => "SHOP#{x}", :city => city}
			shop = Shop.new(conteudo)
			shop.save
		end
  end
end
