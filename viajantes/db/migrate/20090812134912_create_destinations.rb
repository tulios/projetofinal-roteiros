class CreateDestinations < ActiveRecord::Migration
  def self.up
    create_table :destinations do |t|
      t.float :planned_cost
      t.date :start_date
      t.date :end_date
      t.belongs_to :vehicle
      t.belongs_to :roadmap
      t.belongs_to :city

      t.timestamps
    end
  end

  def self.down
    drop_table :destinations
  end
end
