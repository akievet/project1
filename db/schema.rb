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

ActiveRecord::Schema.define(version: 20141020221412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "description"
    t.string   "allergens"
    t.string   "course"
    t.string   "meal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "party_id"
    t.integer  "menu_item_id"
    t.string   "notes"
    t.boolean  "queue"
    t.integer  "price_change"
    t.string   "price_change_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: true do |t|
    t.string   "name"
    t.integer  "number_people"
    t.string   "table_name"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
