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

ActiveRecord::Schema.define(version: 20150522122919) do

  create_table "ots", force: :cascade do |t|
    t.integer  "starting_time", limit: 4
    t.integer  "ending_time",   limit: 4
    t.date     "sdayofOt"
    t.date     "edayofOt"
    t.string   "STAP",          limit: 255
    t.string   "ETAP",          limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "overtimes", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "stimehours",   limit: 4
    t.integer  "stimeminutes", limit: 4
    t.integer  "etimehours",   limit: 4
    t.integer  "etimeminutes", limit: 4
    t.string   "ETAP",         limit: 255
    t.string   "STAP",         limit: 255
    t.date     "sdayofot"
    t.date     "edayofot"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
