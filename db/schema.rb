# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20141125120004) do

  create_table "counts", :force => true do |t|
    t.integer  "repository_id"
    t.integer  "value"
    t.datetime "record_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "csv_exports", :force => true do |t|
    t.text     "csv"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "regex"
    t.datetime "last_checked"
    t.boolean  "graph"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "repository_stats", :force => true do |t|
    t.integer  "repository_id"
    t.integer  "total"
    t.datetime "last_updated"
    t.integer  "modules_day"
    t.integer  "days_to_crossover"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "repository_stats", ["repository_id"], :name => "index_repository_stats_on_repository_id", :unique => true

  create_table "samplers", :force => true do |t|
    t.integer  "repository_id"
    t.string   "type"
    t.string   "data_url"
    t.text     "configuration_json"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
