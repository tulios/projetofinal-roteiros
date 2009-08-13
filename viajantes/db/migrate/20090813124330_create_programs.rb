class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.date :date
      t.float :value, :default => 0
      t.text :description
      t.belongs_to :tourist_sight
      t.belongs_to :shop

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
