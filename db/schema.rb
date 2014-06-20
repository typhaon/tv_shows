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

ActiveRecord::Schema.define(version: 20140618184408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string  "role",               null: false
    t.string  "actor",              null: false
    t.string  "description"
    t.integer "television_show_id"
  end

  create_table "television_shows", force: true do |t|
    t.string "title",    null: false
    t.string "network"
    t.string "years"
    t.string "synopsis"
  end

  add_index "television_shows", ["title", "network"], name: "index_television_shows_on_title_and_network", unique: true, using: :btree

end
