require 'test_helper'

class RoadmapsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roadmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roadmap" do
    assert_difference('Roadmap.count') do
      post :create, :roadmap => { }
    end

    assert_redirected_to roadmap_path(assigns(:roadmap))
  end

  test "should show roadmap" do
    get :show, :id => roadmaps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => roadmaps(:one).to_param
    assert_response :success
  end

  test "should update roadmap" do
    put :update, :id => roadmaps(:one).to_param, :roadmap => { }
    assert_redirected_to roadmap_path(assigns(:roadmap))
  end

  test "should destroy roadmap" do
    assert_difference('Roadmap.count', -1) do
      delete :destroy, :id => roadmaps(:one).to_param
    end

    assert_redirected_to roadmaps_path
  end
end
