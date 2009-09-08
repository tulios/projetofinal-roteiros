class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :phone, :limit => 14
      t.string :fax, :limit => 14
      t.string :email
      t.string :site
      t.text :description
      t.text :additional_info
      t.text :key_words
      t.integer :hits,  :default => 0
      t.belongs_to :city, :null => false
      t.belongs_to :user, :null => false
      t.belongs_to :tourist_sight

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
