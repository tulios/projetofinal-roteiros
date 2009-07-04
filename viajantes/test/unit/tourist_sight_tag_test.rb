require 'test_helper'

class TouristSightTagTest < ActiveSupport::TestCase

	test "Deveria criar um tourist sight tag" do
		ts = 	TouristSight.find(tourist_sights(:one).to_param)
		tag = Tag.find(tags(:one).to_param)

		#verifica que um objeto preenchido e valido
		conteudo = {:tourist_sight => ts, :tag => tag}
		tst = TouristSightTag.new(conteudo)
		assert tst.valid?
		#verifica que nao lancou erros
		assert_validos(tst, [:name, :address, :city])
	end

end
