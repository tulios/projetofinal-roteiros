class CreateTouristSightTags < ActiveRecord::Migration
  def self.up
    create_table :tourist_sight_tags do |t|
      t.belongs_to :tourist_sight, :null => false
      t.belongs_to :tag, :null => false

      t.timestamps
    end
		add_index :tourist_sight_tags, [:tourist_sight_id, :tag_id], :unique => true
  end

  def self.down
    drop_table :tourist_sight_tags
  end
end
