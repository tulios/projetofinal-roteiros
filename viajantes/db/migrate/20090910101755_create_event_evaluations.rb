class CreateEventEvaluations < ActiveRecord::Migration
  def self.up
    create_table :event_evaluations do |t|
      t.belongs_to :event, :null => false
      t.belongs_to :evaluation, :null => false
    end
    add_index :event_evaluations, [:event_id, :evaluation_id], :unique => true
  end

  def self.down
    drop_table :event_evaluations
  end
end
