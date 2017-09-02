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

ActiveRecord::Schema.define(version: 20170828014317) do

  create_table "archives", force: :cascade do |t|
    t.date "ymd"
    t.integer "hour"
    t.string "url", limit: 256
    t.string "site_name", limit: 256
    t.string "title", limit: 256
    t.string "description", limit: 256
    t.string "thumbnail", limit: 256
    t.string "tag", limit: 512
    t.string "category_code", limit: 32
    t.integer "pv", default: 0, null: false
    t.boolean "is_adult", default: false
    t.boolean "is_active", default: true
    t.integer "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_archives_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "site_name", limit: 256, null: false
    t.string "url", limit: 256, null: false
    t.string "domain", limit: 256
    t.string "rss_url", limit: 256, null: false
    t.string "mail", limit: 256
    t.text "description"
    t.integer "rate", default: 1, null: false
    t.integer "rank", default: 0, null: false
    t.integer "mod_interval", default: 0, null: false
    t.integer "pv", default: 0, null: false
    t.integer "outpv", default: 0, null: false
    t.string "category_code", limit: 32
    t.datetime "succeed_at"
    t.datetime "errored_at"
    t.datetime "pv_updated_at"
    t.boolean "is_stop", default: false, null: false
    t.datetime "stoped_at"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
