require 'test_helper'

class EventTipTest < ActiveSupport::TestCase
  
  test "Deveria criar um event_tip" do
    assert_difference "EventTip.count" do
      et = create_event_tip
      assert (not et.new_record?), "#{et.errors.full_messages.to_sentence}"
    end
  end
  
  test "Deveria alterar um event_tip" do
    et = create_event_tip
    update_event_tip et
    assert et.errors.empty?, et.errors.full_messages.to_sentence
  end
  
  test "Deveria apagar um event_tip" do
    et = create_event_tip

    assert_difference "EventTip.count and Tip.count", -1 do
      et.destroy
    end
  end
  
  test "Deveria validar a presença de tip e event" do
    assert_no_difference "EventTip.count" do
      et = create_event_tip(:tip => nil, :event => nil)
      assert et.errors.on(:tip)
      assert et.errors.on(:event)
    end
  end
  
  protected
  
  def create_event_tip(options = {})
      et_hash = {
        :event => events(:one),
        :tip => tips(:one)
      }
      
      et = EventTip.new(et_hash.merge(options))
      et.save
      et
  end
  
  def update_event_tip(et, options = {})
      et_hash = {
        :event => events(:two),
        :tip => tips(:two)
      }
      
      et.update_attributes(et_hash.merge(options))
      et
  end
end
