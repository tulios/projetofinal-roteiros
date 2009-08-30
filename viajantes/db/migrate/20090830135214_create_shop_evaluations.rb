class CreateShopEvaluations < ActiveRecord::Migration
  def self.up
    create_table :shop_evaluations do |t|
      t.belongs_to :shop, :null => false
      t.belongs_to :evaluation, :null => false
    end
    add_index :shop_evaluations, [:shop_id, :evaluation_id], :unique => true
  end

  def self.down
    drop_table :shop_evaluations
  end
end
