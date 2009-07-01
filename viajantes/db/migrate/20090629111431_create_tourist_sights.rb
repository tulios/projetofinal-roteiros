class CreateTouristSights < ActiveRecord::Migration
  def self.up
    create_table :tourist_sights do |t|
      t.string :name
      t.string :address
      t.string :description
			t.belongs_to :state, :null => false
			t.belongs_to :city, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tourist_sights
  end
end
