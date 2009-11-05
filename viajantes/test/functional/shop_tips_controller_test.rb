require 'test_helper'

class ShopTipsControllerTest < ActionController::TestCase
  
  test "Deveria carregar o new" do
    login_as :quentin
    
    get :new, :shop_id => shops(:one).to_param
    assert_response :success
    
    assert(assigns(:shop))
    assert(assigns(:shop_tip))
    assert(assigns(:shop_tip).tip)
  end
  
  test "Deveria criar uma nova dica de estabelecimento" do
    login_as :quentin
  
    assert_difference('ShopTip.count and Tip.count') do
      create_shop_tip(shops(:one).to_param)
      assert(assigns(:tip))
      assert(assigns(:shop_tip))
      assert_response :redirect
    end

    assert_redirected_to shop_path(assigns(:shop_tip).shop)
  end
  
  test "Deveria apagar uma dica de estabelecimento" do
    login_as :quentin
  
    assert_difference('ShopTip.count and Tip.count', -1) do
      delete :destroy, :id => shop_tips(:one).to_param
    end

    assert_redirected_to shop_path(assigns(:shop_tip).shop)
  end
  
  test "Deveria validar a presença de name e description" do
    login_as :quentin
  
    assert_no_difference('ShopTip.count and Tip.count') do
      create_shop_tip(shops(:one).to_param,
        {:name => nil, :description => nil}
      )
      
      assert(assigns(:tip).errors.on(:name))
      assert(assigns(:tip).errors.on(:description))
    end
  end
  
  protected
  
  def create_shop_tip(shop_id, options = {})
    tip_hash = {
      :name => "NomeDaDica",
      :description => "DescricaoDaDica",
    }
    
    post :create, :shop_id => shop_id, :tip => tip_hash.merge(options)
  end
  
end
