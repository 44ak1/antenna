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
    t.string "uuid", limit: 15, null: false
    t.string "url", limit: 255
    t.string "title", limit: 255
    t.string "description", limit: 255
    t.text "body"
    t.string "real_image_url", limit: 255
    t.string "image", limit: 255
    t.string "tag", limit: 511
    t.integer "pv", default: 0, null: false
    t.datetime "published_at"
    t.boolean "is_safety", default: true
    t.boolean "is_active", default: true
    t.integer "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["is_active"], name: "index_archives_on_is_active"
    t.index ["is_safety"], name: "index_archives_on_is_safety"
    t.index ["published_at"], name: "index_archives_on_published_at"
    t.index ["site_id"], name: "index_archives_on_site_id"
    t.index ["uuid"], name: "index_archives_on_uuid", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "url", limit: 255, null: false
    t.string "domain", limit: 255
    t.string "rss_url", limit: 255, null: false
    t.string "email", limit: 255
    t.text "description"
    t.integer "rate", default: 1, null: false
    t.integer "rank", default: 0, null: false
    t.integer "modify_interval", default: 0, null: false
    t.integer "in", default: 0, null: false
    t.integer "out", default: 0, null: false
    t.string "category_code", limit: 32
    t.boolean "is_crawlable", default: true, null: false
    t.datetime "successed_at"
    t.datetime "errored_at"
    t.boolean "is_recommendable", default: true, null: false
    t.datetime "unrecommended_at"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sites_on_name", unique: true
  end

end
