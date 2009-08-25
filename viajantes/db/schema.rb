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

ActiveRecord::Schema.define(:version => 20090813124330) do

  create_table "cities", :force => true do |t|
    t.integer "state_id", :null => false
    t.string  "name"
  end

  create_table "countries", :force => true do |t|
    t.string "symbol"
    t.string "name"
  end

  create_table "destinations", :force => true do |t|
    t.float    "planned_cost"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "vehicle_id"
    t.integer  "roadmap_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.date     "date"
    t.float    "value",            :default => 0.0
    t.text     "description"
    t.integer  "destination_id",   :null => false
    t.integer  "tourist_sight_id", :null => true
    t.integer  "shop_id",					 :null => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.integer "country_id", :null => false
    t.string  "name"
  end

  create_table "roadmaps", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "public",      :default => false
    t.integer  "city_id",                        :null => false
    t.integer  "user_id",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "shops", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone",            :limit => 14
    t.text     "description"
    t.text     "key_words"
    t.integer  "hits",                           :default => 0
    t.integer  "city_id",                                       :null => false
    t.integer  "user_id",                                       :null => false
    t.integer  "tourist_sight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.integer "country_id", :null => false
    t.integer "region_id",  :null => false
    t.string  "symbol"
    t.string  "name"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "tips", :force => true do |t|
    t.string   "name",             :limit => 50, :null => false
    t.text     "description",                    :null => false
    t.integer  "tourist_sight_id",               :null => false
    t.integer  "user_id",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tourist_sight_tags", :force => true do |t|
    t.integer  "tourist_sight_id", :null => false
    t.integer  "tag_id",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tourist_sight_tags", ["tourist_sight_id", "tag_id"], :name => "index_tourist_sight_tags_on_tourist_sight_id_and_tag_id", :unique => true

  create_table "tourist_sights", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.integer  "city_id",                    :null => false
    t.integer  "user_id",                    :null => false
    t.integer  "hits",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "sex",                       :limit => 1
    t.date     "birthday"
    t.integer  "city_id"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "vehicles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
