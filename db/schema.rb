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

ActiveRecord::Schema.define(version: 20140321032648) do

  create_table "boards", force: true do |t|
    t.string   "name",               limit: 256
    t.text     "description"
    t.integer  "width"
    t.integer  "height"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "demo",                           default: false
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id"

  create_table "photos", force: true do |t|
    t.integer  "tack_id"
    t.string   "title",              limit: 256
    t.text     "description"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "demo",                           default: false
  end

  add_index "photos", ["tack_id"], name: "index_photos_on_tack_id"

  create_table "tacks", force: true do |t|
    t.string   "name",        limit: 256
    t.text     "description"
    t.integer  "top"
    t.integer  "left"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "demo",                    default: false
  end

  add_index "tacks", ["board_id"], name: "index_tacks_on_board_id"

  create_table "users", force: true do |t|
    t.string   "name",       limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
