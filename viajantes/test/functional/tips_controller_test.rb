require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tip" do
    assert_difference('Tip.count') do
      post :create, :tip => { }
    end

    assert_redirected_to tip_path(assigns(:tip))
  end

  test "should show tip" do
    get :show, :id => tips(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tips(:one).to_param
    assert_response :success
  end

  test "should update tip" do
    put :update, :id => tips(:one).to_param, :tip => { }
    assert_redirected_to tip_path(assigns(:tip))
  end

  test "should destroy tip" do
    assert_difference('Tip.count', -1) do
      delete :destroy, :id => tips(:one).to_param
    end

    assert_redirected_to tips_path
  end
end
