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

ActiveRecord::Schema.define(version: 20161020173429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "credits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "eventr_credits"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "for_fb_event_id"
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "role",           default: 0
    t.boolean  "enabled",        default: false
    t.boolean  "event_attended", default: false
    t.uuid     "uuid",           default: -> { "uuid_generate_v4()" }
    t.integer  "state",          default: 0
    t.index ["group_id"], name: "index_group_users_on_group_id", using: :btree
    t.index ["user_id"], name: "index_group_users_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "fb_event_id"
    t.string   "name"
    t.integer  "owner_id"
    t.uuid     "uuid",             default: -> { "uuid_generate_v4()" }
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.datetime "event_end_time"
    t.datetime "event_start_time"
    t.string   "event_name"
    t.string   "channel_url"
    t.string   "invite_code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "fb_id"
    t.string   "name"
    t.string   "email"
    t.uuid     "uuid",       default: -> { "uuid_generate_v4()" }
    t.string   "pic_url"
    t.text     "fb_token"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_foreign_key "credits", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
end
