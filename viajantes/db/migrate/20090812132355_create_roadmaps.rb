class CreateRoadmaps < ActiveRecord::Migration
  def self.up
    create_table :roadmaps do |t|
      t.string :title
      t.text :description
			t.belongs_to :city, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :roadmaps
  end
end
