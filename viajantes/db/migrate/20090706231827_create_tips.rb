class CreateTips < ActiveRecord::Migration
  def self.up
    create_table :tips do |t|
      t.string :name, :null => false, :limit => 50
      t.text :description, :null => false
      t.belongs_to :tourist_sight, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tips
  end
end
