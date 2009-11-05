require 'test_helper'

class TouristSightEvaluationsControllerTest < ActionController::TestCase

  test "Deveria carregar o new" do
		login_as :quentin

    ts = TouristSight.find(tourist_sights(:one).to_param)

    get :new, :tourist_sight_id => ts.id
    assert_response :success

		assert_not_nil assigns(:tourist_sight)
		assert_not_nil assigns(:city)
    assert_not_nil assigns(:tourist_sight_evaluation)
    assert_not_nil assigns(:tourist_sight_evaluation).evaluation
    assert_not_nil assigns(:tourist_sight_evaluation).tourist_sight
  end

  test "Deveria criar uma associacao tourist_sight_evaluation" do
  	login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(0, Evaluation.count)

    ts = TouristSight.find(tourist_sights(:one).to_param)

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
    post :create, :tourist_sight_id => ts.id,
         :general => "1", :clean => "3",
         :evaluation => {:criticism => "Criticism"}

		assert_equal(1, Evaluation.count)

    assert_redirected_to tourist_sight_path(ts)

		# Verifica se o usuario foi definido
		assert_not_nil assigns(:tourist_sight_evaluation)
		assert_not_nil assigns(:tourist_sight_evaluation).tourist_sight
    assert_not_nil assigns(:tourist_sight_evaluation).evaluation

    ev = assigns(:tourist_sight_evaluation).evaluation

    assert_not_nil(ev.user)
    assert_equal("quentin", ev.user.login)
    assert_equal(ts.city, ev.city)

    assert_equal("Criticism", ev.criticism)
    assert_equal(1, ev.general)
    assert_equal(3, ev.clean)
    assert_equal(0, ev.attendance)
    assert_equal(0, ev.infrastructure)
    assert_equal(0, ev.location)
    assert_equal(0, ev.price)
    assert_equal(0, ev.service)
  end

  test "Deveria detalhar um tourist_sight_evaluation" do
    ts = TouristSight.find(tourist_sights(:one).to_param)

    tse = create_tourist_sight_evaluation

    get :show, :tourist_sight_id => ts.id, :id => tse.id

    assert_response :success
		assert_not_nil assigns(:tourist_sight)
		assert_not_nil assigns(:city)
    assert_not_nil assigns(:tourist_sight_evaluation)
    assert_not_nil assigns(:evaluation)
  end

  test "Deveria apagar um shop_evaluation" do
    login_as :quentin

		tse = create_tourist_sight_evaluation
    ts = tse.tourist_sight
		# Veririca a quantidade de objetos antes da exclusao
		assert_equal(1, TouristSightEvaluation.count)
    assert_equal(1, Evaluation.count)

		# Verifica se o controlador redirecionou para o lugar correto
    delete :destroy, :id => tse.id
    assert_redirected_to tourist_sight_path(ts)

		# Verifica a quantidade apos a exclusao
		assert_equal(0, TouristSightEvaluation.count)
    assert_equal(0, Evaluation.count)
  end

  private
  def create_tourist_sight_evaluation
    tse = TouristSightEvaluation.new
    tse.evaluation = Evaluation.new(:criticism => "Criticism")
    tse.evaluation.user = User.find(users(:quentin).to_param)

    ts = TouristSight.find(tourist_sights(:one).to_param)

    tse.evaluation.city = ts.city
    tse.tourist_sight = ts

    assert(tse.evaluation.save)
    assert(tse.save)
    tse
  end

end
