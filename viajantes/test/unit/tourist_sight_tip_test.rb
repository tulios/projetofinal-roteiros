require 'test_helper'

class TouristSightTipTest < ActiveSupport::TestCase
  
  test "Deveria criar um tourist_sight_tip" do
    assert_difference "TouristSightTip.count" do
      tst = create_tourist_sight_tip
      assert (not tst.new_record?), "#{tst.errors.full_messages.to_sentence}"
    end
  end
  
  test "Deveria alterar um tourist_sight_tip" do
    tst = create_tourist_sight_tip
    update_tourist_sight_tip tst
    assert tst.errors.empty?, tst.errors.full_messages.to_sentence
  end
  
  test "Deveria apagar um tourist_sight_tip" do
    tst = create_tourist_sight_tip

    assert_difference "TouristSightTip.count and Tip.count", -1 do
      tst.destroy
    end
  end
  
  test "Deveria validar a presença de tip e tourist_sight" do
    assert_no_difference "TouristSightTip.count" do
      tst = create_tourist_sight_tip(:tip => nil, :tourist_sight => nil)
      assert tst.errors.on(:tip)
      assert tst.errors.on(:tourist_sight)
    end
  end
  
  protected
  
  def create_tourist_sight_tip(options = {})
      tst_hash = {
        :tourist_sight => tourist_sights(:one),
        :tip => tips(:one)
      }
      
      tst = TouristSightTip.new(tst_hash.merge(options))
      tst.save
      tst
  end
  
  def update_tourist_sight_tip(tst, options = {})
      tst_hash = {
        :tourist_sight => tourist_sights(:two),
        :tip => tips(:two)
      }
      
      tst.update_attributes(tst_hash.merge(options))
      tst
  end
  
end
