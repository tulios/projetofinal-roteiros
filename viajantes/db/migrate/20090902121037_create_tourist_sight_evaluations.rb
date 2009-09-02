class CreateTouristSightEvaluations < ActiveRecord::Migration
  def self.up
    create_table :tourist_sight_evaluations do |t|
      t.belongs_to :tourist_sight, :null => false
      t.belongs_to :evaluation, :null => false
    end
    add_index :tourist_sight_evaluations, 
    					[:tourist_sight_id, :evaluation_id], :unique => true,
    					:name => "index_tourist_sight_evaluations"
  end

  def self.down
    drop_table :tourist_sight_evaluations
  end
end
