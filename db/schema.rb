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

ActiveRecord::Schema.define(version: 2019_02_18_065225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "country", limit: 255, null: false
    t.string "place", limit: 255, null: false
    t.bigint "travel_id", null: false
    t.date "arrived_at", null: false
    t.date "left_at", null: false
    t.index ["travel_id"], name: "index_areas_on_travel_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "sentence", limit: 255, null: false
    t.integer "frame_style", null: false
    t.integer "font_style", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_cards_on_travel_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "data", limit: 255, default: ""
    t.bigint "card_id", null: false
    t.index ["card_id"], name: "index_images_on_card_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "remark", limit: 255, default: ""
    t.bigint "list_id", null: false
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.bigint "travel_id", null: false
    t.index ["travel_id"], name: "index_lists_on_travel_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "content", limit: 255, null: false
    t.string "image", limit: 255, default: ""
    t.boolean "importance", default: false, null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_notes_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.date "departed_at", null: false
    t.date "returned_at", null: false
    t.string "travel_image", limit: 255, default: ""
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 255, null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "areas", "travels"
  add_foreign_key "cards", "travels"
  add_foreign_key "images", "cards"
  add_foreign_key "items", "lists"
  add_foreign_key "lists", "travels"
  add_foreign_key "notes", "travels"
  add_foreign_key "travels", "users"
end
