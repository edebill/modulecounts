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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151127171342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counts", force: :cascade do |t|
    t.integer  "repository_id"
    t.integer  "value"
    t.datetime "record_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "csv_exports", force: :cascade do |t|
    t.text     "csv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "url",          limit: 255
    t.string   "regex",        limit: 255
    t.datetime "last_checked"
    t.boolean  "graph"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "repository_stats", force: :cascade do |t|
    t.integer  "repository_id"
    t.integer  "total"
    t.datetime "last_updated"
    t.integer  "modules_day"
    t.integer  "days_to_crossover"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["repository_id"], name: "index_repository_stats_on_repository_id", unique: true, using: :btree
  end

  create_table "samplers", force: :cascade do |t|
    t.integer  "repository_id"
    t.string   "type",               limit: 255
    t.string   "data_url",           limit: 255
    t.text     "configuration_json"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
