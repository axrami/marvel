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

ActiveRecord::Schema.define(version: 20141017003117) do

  create_table "characters", force: true do |t|
    t.integer  "marvel_id"
    t.string   "name"
    t.text     "description"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comics", force: true do |t|
    t.integer  "comic_id"
    t.string   "name"
    t.text     "description"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", force: true do |t|
    t.string   "title"
    t.integer  "series_id"
    t.text     "description"
    t.integer  "start_year"
    t.integer  "end_year"
    t.string   "rating"
    t.string   "thumbnail"
    t.text     "creators"
    t.text     "characters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
