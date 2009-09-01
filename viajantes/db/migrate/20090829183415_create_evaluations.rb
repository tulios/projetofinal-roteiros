class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.text :criticism
      t.belongs_to :city, :null => false
      t.belongs_to :user, :null => false
      t.integer :general, :default => 0
			t.integer :service, :default => 0
			t.integer :clean, :default => 0
			t.integer :location, :default => 0
	    t.integer :price, :default => 0
	    t.integer :infrastructure, :default => 0
			t.integer :attendance, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
