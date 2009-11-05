require 'test_helper'

class ShopEvaluationsControllerTest < ActionController::TestCase

  test "Deveria carregar o new" do
		login_as :quentin

    shop = Shop.find(shops(:one).to_param)

    get :new, :shop_id => shop.id
    assert_response :success

		assert_not_nil assigns(:shop)
		assert_not_nil assigns(:city)
    assert_not_nil assigns(:shop_evaluation)
    assert_not_nil assigns(:shop_evaluation).evaluation
    assert_not_nil assigns(:shop_evaluation).shop
  end

  test "Deveria criar uma associacao shop_evaluation" do
  	login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(0, Evaluation.count)

    shop = Shop.find(shops(:one).to_param)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
    post :create, :shop_id => shop.id,
         :general => "1", :clean => "3",
         :evaluation => {:criticism => "Criticism"}
       
		assert_equal(1, Evaluation.count)

    assert_redirected_to shop_path(shop)

		# Verifica se o usuario foi definido
		assert_not_nil assigns(:shop_evaluation)
		assert_not_nil assigns(:shop_evaluation).shop
    assert_not_nil assigns(:shop_evaluation).evaluation

    ev = assigns(:shop_evaluation).evaluation

    assert_not_nil(ev.user)
    assert_equal("quentin", ev.user.login)
    assert_equal(shop.city, ev.city)

    assert_equal("Criticism", ev.criticism)
    assert_equal(1, ev.general)
    assert_equal(3, ev.clean)
    assert_equal(0, ev.attendance)
    assert_equal(0, ev.infrastructure)
    assert_equal(0, ev.location)
    assert_equal(0, ev.price)
    assert_equal(0, ev.service)
  end

  test "Deveria detalhar um shop_evaluation" do
    shop = Shop.find(shops(:one).to_param)

    se = create_shop_evaluation

    get :show, :shop_id => shop.id, :id => se.id
    
    assert_response :success
		assert_not_nil assigns(:shop)
		assert_not_nil assigns(:city)
    assert_not_nil assigns(:shop_evaluation)
    assert_not_nil assigns(:evaluation)
  end

  test "Deveria apagar um shop_evaluation" do
    login_as :quentin

		se = create_shop_evaluation
    shop = se.shop
		# Veririca a quantidade de objetos antes da exclusao
		assert_equal(1, ShopEvaluation.count)
    assert_equal(1, Evaluation.count)

		# Verifica se o controlador redirecionou para o lugar correto
    delete :destroy, :id => se.id
    assert_redirected_to shop_path(shop)

		# Verifica a quantidade apos a exclusao
		assert_equal(0, ShopEvaluation.count)
    assert_equal(0, Evaluation.count)
  end       
                                                                 
  private
  def create_shop_evaluation
    se = ShopEvaluation.new
    se.evaluation = Evaluation.new(:criticism => "Criticism")
    se.evaluation.user = User.find(users(:quentin).to_param)

    shop = Shop.find(shops(:one).to_param)

    se.evaluation.city = shop.city
    se.shop = shop

    assert(se.evaluation.save)
    assert(se.save)
    se
  end

end






















