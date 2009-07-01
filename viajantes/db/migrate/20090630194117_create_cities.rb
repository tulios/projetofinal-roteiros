class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
		  t.belongs_to :state, :null => false
      t.string :name
    end
  end

  def self.down
    drop_table :cities
  end
end
