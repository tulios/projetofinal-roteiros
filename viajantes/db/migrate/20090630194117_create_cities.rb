class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
		  t.belongs_to :state, :null => false
      t.string :name
      t.boolean :capital
      t.float :latitude
      t.float :longitude
    end
  end

  def self.down
    drop_table :cities
  end
end
