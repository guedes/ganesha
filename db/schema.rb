# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110324000156) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "collected_data", :force => true do |t|
    t.integer  "script_target_id"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "databases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "databases", ["name", "instance_id"], :name => "index_databases_on_name_and_instance_id", :unique => true

  create_table "instances", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "port",        :default => 5432
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instances", ["server_id"], :name => "index_instances_on_server_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "script_targets", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "script_id"
    t.integer  "targetable_id"
    t.string   "targetable_type"
  end

  add_index "script_targets", ["script_id"], :name => "index_data_collectors_on_script_id"
  add_index "script_targets", ["targetable_id", "targetable_type"], :name => "index_script_targets_on_targetable_id_and_targetable_type"

  create_table "scripts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scripts", ["name"], :name => "index_scripts_on_name", :unique => true

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "host_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
  end

end
