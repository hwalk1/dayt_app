# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_07_030632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dayt_tags", force: :cascade do |t|
    t.bigint "dayt_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dayt_id"], name: "index_dayt_tags_on_dayt_id"
    t.index ["tag_id"], name: "index_dayt_tags_on_tag_id"
  end

  create_table "dayts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "location"
    t.decimal "duration"
    t.decimal "price"
    t.integer "opening_time"
    t.integer "closing_time"
    t.string "booking_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_dayts_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.bigint "dayt_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dayt_id"], name: "index_reviews_on_dayt_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_dayts", force: :cascade do |t|
    t.integer "order"
    t.bigint "trip_id", null: false
    t.bigint "dayt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dayt_id"], name: "index_trip_dayts_on_dayt_id"
    t.index ["trip_id"], name: "index_trip_dayts_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dayt_tags", "dayts"
  add_foreign_key "dayt_tags", "tags"
  add_foreign_key "reviews", "dayts"
  add_foreign_key "reviews", "users"
  add_foreign_key "trip_dayts", "dayts"
  add_foreign_key "trip_dayts", "trips"
  add_foreign_key "trips", "users"
end
