require 'test_helper'

class ShopTipTest < ActiveSupport::TestCase
  
  test "Deveria criar um shop_tip" do
    assert_difference "ShopTip.count" do
      st = create_shop_tip
      assert (not st.new_record?), "#{st.errors.full_messages.to_sentence}"
    end
  end
  
  test "Deveria alterar um shop_tip" do
    st = create_shop_tip
    update_shop_tip st
    assert st.errors.empty?, st.errors.full_messages.to_sentence
  end
  
  test "Deveria apagar um tourist_sight_tip" do
    st = create_shop_tip

    assert_difference "ShopTip.count and Tip.count", -1 do
      st.destroy
    end
  end
  
  test "Deveria validar a presença de tip e shop" do
    assert_no_difference "ShopTip.count" do
      tst = create_shop_tip(:tip => nil, :shop => nil)
      assert tst.errors.on(:tip)
      assert tst.errors.on(:shop)
    end
  end
  
  protected
  
  def create_shop_tip(options = {})
      st_hash = {
        :shop => shops(:one),
        :tip => tips(:one)
      }
      
      st = ShopTip.new(st_hash.merge(options))
      st.save
      st
  end
  
  def update_shop_tip(st, options = {})
      st_hash = {
        :shop => shops(:two),
        :tip => tips(:two)
      }
      
      st.update_attributes(st_hash.merge(options))
      st
  end
end
