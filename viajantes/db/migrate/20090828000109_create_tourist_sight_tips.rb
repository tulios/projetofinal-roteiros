class CreateTouristSightTips < ActiveRecord::Migration
  def self.up
    create_table :tourist_sight_tips do |t|
      t.belongs_to :tourist_sight
      t.belongs_to :tip

      t.timestamps
    end
  end

  def self.down
    drop_table :tourist_sight_tips
  end
end
