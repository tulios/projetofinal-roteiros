class CreateEventTips < ActiveRecord::Migration
  def self.up
    create_table :event_tips do |t|
      t.belongs_to :event
      t.belongs_to :tip

    end
  end

  def self.down
    drop_table :event_tips
  end
end
