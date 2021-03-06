class CreateRoadmaps < ActiveRecord::Migration
  def self.up
    create_table :roadmaps do |t|
      t.string :title
      t.text :description
			t.boolean :public, :default => false
			t.belongs_to :city, :null => false
			t.belongs_to :user, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :roadmaps
  end
end
