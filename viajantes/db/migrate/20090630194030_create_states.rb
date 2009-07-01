class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.belongs_to :country, :null => false
			t.belongs_to :region, :null => false
      t.string :symbol
      t.string :name
    end
  end

  def self.down
    drop_table :states
  end
end
