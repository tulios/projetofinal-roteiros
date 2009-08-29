class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.integer :rate, :default => 0
      t.text :criticism
      t.belongs_to :city, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :evaluations
  end
end
