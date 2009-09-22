class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.belongs_to :city
      t.belongs_to :user
      t.string :name
      t.timestamp :time
      t.string :address
      t.float :cost, :default => 0
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
