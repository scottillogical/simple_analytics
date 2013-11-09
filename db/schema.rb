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

ActiveRecord::Schema.define(version: 20131104210230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "events", force: true do |t|
    t.uuid     "network_user_id"
    t.uuid     "domain_user_id"
    t.text     "url"
    t.string   "app_id"
    t.string   "ip_address"
    t.string   "user_id"
    t.text     "user_agent"
    t.string   "event_type"
    t.string   "event_desc"
    t.text     "referrer"
    t.text     "utm_source"
    t.string   "utm_medium"
    t.string   "utm_campaign"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "page_urlhost"
    t.text     "page_path"
    t.text     "page_query"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "destination_url"
    t.string   "item_id"
    t.string   "item_desc"
    t.text     "pixel_url"
  end

end
