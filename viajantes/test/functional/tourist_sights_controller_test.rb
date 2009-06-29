require 'test_helper'

class TouristSightsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tourist_sights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tourist_sight" do
    assert_difference('TouristSight.count') do
      post :create, :tourist_sight => { }
    end

    assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
  end

  test "should show tourist_sight" do
    get :show, :id => tourist_sights(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tourist_sights(:one).to_param
    assert_response :success
  end

  test "should update tourist_sight" do
    put :update, :id => tourist_sights(:one).to_param, :tourist_sight => { }
    assert_redirected_to tourist_sight_path(assigns(:tourist_sight))
  end

  test "should destroy tourist_sight" do
    assert_difference('TouristSight.count', -1) do
      delete :destroy, :id => tourist_sights(:one).to_param
    end

    assert_redirected_to tourist_sights_path
  end
end
