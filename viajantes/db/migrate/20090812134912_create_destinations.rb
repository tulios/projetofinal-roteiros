class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.float :planned_cost
      t.belongs_to :vehicle
      t.belongs_to :road_map
      t.belongs_to :city

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
