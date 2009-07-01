# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090630194117) do

  create_table "cities", :force => true do |t|
    t.integer "state_id", :null => false
    t.string  "name"
  end

  create_table "countries", :force => true do |t|
    t.string "symbol"
    t.string "name"
  end

  create_table "regions", :force => true do |t|
    t.integer "country_id", :null => false
    t.string  "name"
  end

  create_table "states", :force => true do |t|
    t.integer "country_id", :null => false
    t.integer "region_id",  :null => false
    t.string  "symbol"
    t.string  "name"
  end

  create_table "tourist_sights", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "description"
    t.integer  "city_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
