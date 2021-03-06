class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.date :date
      t.float :value, :default => 0
      t.text :description
      t.belongs_to :destination, :null => false
      t.belongs_to :tourist_sight, :null => true
      t.belongs_to :shop, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
