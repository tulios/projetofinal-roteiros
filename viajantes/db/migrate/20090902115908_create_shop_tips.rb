class CreateShopTips < ActiveRecord::Migration
  def self.up
    create_table :shop_tips do |t|
      t.belongs_to :shop
      t.belongs_to :tip
    end
  end

  def self.down
    drop_table :shop_tips
  end
end
