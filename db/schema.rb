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

ActiveRecord::Schema.define(version: 20170330095421) do

  create_table "event_rankings", force: :cascade do |t|
    t.integer  "event_count",        limit: 4,               null: false
    t.integer  "ranking",            limit: 4,               null: false
    t.string   "user_code",          limit: 255,             null: false
    t.string   "name",               limit: 255,             null: false
    t.integer  "rank",               limit: 4,               null: false
    t.integer  "total_kill",         limit: 4,   default: 0
    t.integer  "total_contribution", limit: 8,   default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "event_rankings", ["event_count", "ranking"], name: "idx_to_event", unique: true, using: :btree
  add_index "event_rankings", ["event_count"], name: "index_event_rankings_on_event_count", using: :btree
  add_index "event_rankings", ["rank"], name: "index_event_rankings_on_rank", using: :btree
  add_index "event_rankings", ["user_code"], name: "index_event_rankings_on_user_code", using: :btree

  create_table "my_twitters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
