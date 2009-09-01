class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.belongs_to :city
      t.string :name
      t.time :time
      t.belongs_to :tourist_sight
      t.belongs_to :shops
      t.boolean :cost
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
