require 'test_helper'

class EventEvaluationsControllerTest < ActionController::TestCase
  test "Deveria carregar o new" do
		login_as :quentin

    event = Event.find(events(:one.to_param))	

    get :new, :event_id => event.id
    assert_response :success

		assert_not_nil assigns(:event)
		assert_not_nil assigns(:city)
    assert_not_nil assigns(:event_evaluation)
    assert_not_nil assigns(:event_evaluation).evaluation
    assert_not_nil assigns(:event_evaluation).event
  end

  test "Deveria criar uma associacao event_evaluation" do
  	login_as :quentin

		# Verifica que so existe os criados pela fixture
		assert_equal(0, Evaluation.count)

    event = Event.find(events(:one.to_param))	

		# Verifica que o controlador criou um novo e redirecionou para o lugar certo
    post :create, :event_id => event.id,
         :general => "1", :clean => "3",
         :evaluation => {:criticism => "Criticism"}
       
		assert_equal(1, Evaluation.count)

    assert_redirected_to event_path(event)

		# Verifica se o usuario foi definido
		assert_not_nil assigns(:event_evaluation)
		assert_not_nil assigns(:event_evaluation).event
    assert_not_nil assigns(:event_evaluation).evaluation

    ev = assigns(:event_evaluation).evaluation

    assert_not_nil(ev.user)
    assert_equal("quentin", ev.user.login)
    assert_equal(event.city, ev.city)

    assert_equal("Criticism", ev.criticism)
    assert_equal(1, ev.general)
    assert_equal(3, ev.clean)
    assert_equal(0, ev.attendance)
    assert_equal(0, ev.infrastructure)
    assert_equal(0, ev.location)
    assert_equal(0, ev.price)
    assert_equal(0, ev.service)
  end

  test "Deveria detalhar um event_evaluation" do
    event = Event.find(events(:one.to_param))	

    ee = create_event_evaluation

    get :show, :event_id => event.id, :id => ee.id
    
    assert_response :success
		assert_not_nil assigns(:event)
		assert_not_nil assigns(:city)
    assert_not_nil assigns(:event_evaluation)
    assert_not_nil assigns(:evaluation)
  end

  test "Deveria apagar um event_evaluation" do
    login_as :quentin

		ee = create_event_evaluation
    event = ee.event
		# Veririca a quantidade de objetos antes da exclusao
		assert_equal(1, EventEvaluation.count)
    assert_equal(1, Evaluation.count)

		# Verifica se o controlador redirecionou para o lugar correto
    delete :destroy, :id => ee.id
    assert_redirected_to event_path(event)

		# Verifica a quantidade apos a exclusao
		assert_equal(0, EventEvaluation.count)
    assert_equal(0, Evaluation.count)
  end

  private
  def create_event_evaluation
    ee = EventEvaluation.new
    ee.evaluation = Evaluation.new(:criticism => "Criticism")
    ee.evaluation.user = User.find(users(:quentin).to_param)

		event = Event.find(events(:one.to_param))	
	
    ee.evaluation.city = event.city
    ee.event = event

    assert(ee.evaluation.save)
    assert(ee.save)
    ee
  end
end
