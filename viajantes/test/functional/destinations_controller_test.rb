require 'test_helper'

class DestinationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destination" do
    assert_difference('Destination.count') do
      post :create, :destination => { }
    end

    assert_redirected_to destination_path(assigns(:destination))
  end

  test "should show destination" do
    get :show, :id => destinations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => destinations(:one).to_param
    assert_response :success
  end

  test "should update destination" do
    put :update, :id => destinations(:one).to_param, :destination => { }
    assert_redirected_to destination_path(assigns(:destination))
  end

  test "should destroy destination" do
    assert_difference('Destination.count', -1) do
      delete :destroy, :id => destinations(:one).to_param
    end

    assert_redirected_to destinations_path
  end
end
