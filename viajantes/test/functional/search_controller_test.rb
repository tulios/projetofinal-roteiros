require 'test_helper'

class SearchControllerTest < ActionController::TestCase

  test "Deveria recuperar pontos turisticos e estabelecimentos pelo nome ou palavra chave" do

    get :index, :value => "o"
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_not_nil(assigns(:shops))

    assert_equal(2,assigns(:tourist_sights).length)
    assert_equal(2,assigns(:shops).length)
    assert_equal(true,assigns(:results))
  end

  test "Deveria recuperar estabelecimentos pelo nome ou palavra chave" do

    get :index, :value => "sHoP"
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_not_nil(assigns(:shops))

    assert_equal(0,assigns(:tourist_sights).length)
    assert_equal(2,assigns(:shops).length)
    assert_equal(true,assigns(:results))

    get :index, :value => "sHoP-1"
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_not_nil(assigns(:shops))

    assert_equal(0,assigns(:tourist_sights).length)
    assert_equal(1,assigns(:shops).length)
    assert_equal(true,assigns(:results))
  end

  test "Deveria recuperar pontos turisticos pelo nome" do

    get :index, :value => "pOnTo"
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_not_nil(assigns(:shops))

    assert_equal(2,assigns(:tourist_sights).length)
    assert_equal(0,assigns(:shops).length)
    assert_equal(true,assigns(:results))

    get :index, :value => "PoNtOtUrIsTo1"
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_not_nil(assigns(:shops))

    assert_equal(1,assigns(:tourist_sights).length)
    assert_equal(0,assigns(:shops).length)
    assert_equal(true,assigns(:results))
  end

  test "Deveria nao encontrar nenhum resultado" do

    get :index, :value => "texto_nao_existente"
    assert_response :success

    assert_not_nil(assigns(:tourist_sights))
    assert_not_nil(assigns(:shops))

    assert_equal(0,assigns(:tourist_sights).length)
    assert_equal(0,assigns(:shops).length)
    assert_equal(false,assigns(:results))
  end
end
