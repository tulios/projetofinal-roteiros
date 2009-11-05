require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase

  test "Deveria criar uma evaluation" do
		#verifica que um objeto vazio nao e valido
		ev = Evaluation.new
		assert (not ev.valid?)
		#verifica os erros lancados
		assert_invalidos(ev, [:user_id, :city_id, :criticism])

    city_id = cities(:one).to_param
    user_id = users(:quentin).to_param

		city = City.find(city_id)
    user = User.find(user_id)

		#verifica que um objeto preenchido e valido
		conteudo = {:criticism => "text", :city => city, :user => user}
		ev = Evaluation.new(conteudo)
		assert ev.valid?

		#verifica que nao lancou erros
		assert_validos(ev, [:user_id, :city_id, :criticism])
	end

  test "Deveria preencher as notas a partir de um hash de strings" do
    # Verifica que todas comecam em zero(0)
    ev = Evaluation.new
    assert_equal(0, ev.general)
    assert_equal(0, ev.clean)
    assert_equal(0, ev.attendance)
    assert_equal(0, ev.infrastructure)
    assert_equal(0, ev.location)
    assert_equal(0, ev.price)
    assert_equal(0, ev.service)

    hash = {:general          => "1",
            :clean            => "2",
            :attendance       => "3",
            :infrastructure   => "4",
            :location         => "5",
            :price            => "1",
            :service          => "2"
    }
    
    # Chama o metodo de preenchimento
    ev.fill_rates(hash);
    assert_equal(1, ev.general)
    assert_equal(2, ev.clean)
    assert_equal(3, ev.attendance)
    assert_equal(4, ev.infrastructure)
    assert_equal(5, ev.location)
    assert_equal(1, ev.price)
    assert_equal(2, ev.service)

  end

end

















