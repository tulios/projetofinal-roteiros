class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.text :description
      t.text :key_words
      t.belongs_to :city
      t.belongs_to :tourist_sight

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
