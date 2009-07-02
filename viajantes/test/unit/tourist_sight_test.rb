require 'test_helper'

class TouristSightTest < ActiveSupport::TestCase
	
	test "Deveria criar um tourist sight" do
		#verifica que um objeto vazio nao e valido
		ts = TouristSight.new
		assert (not ts.valid?)
		#verifica os erros lancados
		assert_invalidos (ts, [:name, :address, :city])
		
		city_id = cities(:one).to_param
		city = City.find(city_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:name => "TS1", :address => "ADS1", :description => "desc1", :city => city}
		ts = TouristSight.new(conteudo)
		assert ts.valid?
		#verifica que nao lancou erros
		assert_validos (ts, [:name, :address, :city])
	end

	private
	def assert_invalidos(objeto, invalidos)
		invalidos.each do |invalido|
				assert objeto.errors.invalid?(invalido), "parametro: #{invalido}"
		end
	end

	def assert_validos(objeto, validos)
		validos.each do |valido|
				assert !objeto.errors.invalid?(valido), "parametro: #{valido}"
		end
	end
end
