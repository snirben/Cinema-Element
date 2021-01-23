# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_23_153004) do

  create_table "buyfeedbacks", force: :cascade do |t|
    t.text "name"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.string "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "halls", force: :cascade do |t|
    t.string "title", default: ""
    t.integer "hall_num", null: false
    t.integer "floor", default: 0
    t.integer "seats", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age_limit"
    t.integer "price", default: 0
    t.integer "old_price", default: 0
    t.string "category"
    t.string "director"
    t.string "rating"
    t.text "description"
    t.integer "movie_length"
    t.integer "category_id"
    t.integer "booked_counter", default: 0
    t.string "blob_file_name"
    t.string "blob_content_type"
    t.bigint "blob_file_size"
    t.datetime "blob_updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "seat_id"
    t.integer "order_id"
    t.decimal "unit_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal"
    t.decimal "total"
    t.integer "user_id"
    t.text "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "screens", force: :cascade do |t|
    t.integer "movie_id"
    t.datetime "screen_at"
    t.integer "hall_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", force: :cascade do |t|
    t.boolean "is_taken", default: false, null: false
    t.boolean "is_free", default: true
    t.integer "hall_id", null: false
    t.datetime "taken_at"
    t.integer "seat_num"
    t.integer "ticket_id"
    t.integer "screen_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "movie_id", null: false
    t.integer "screen_id", null: false
    t.integer "seat_id", null: false
    t.integer "hall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "country", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
