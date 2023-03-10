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

ActiveRecord::Schema[7.0].define(version: 2023_03_09_145334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "duration"
    t.string "address"
    t.float "price_person"
    t.text "comment"
    t.bigint "day_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_activities_on_day_id"
    t.index ["trip_id"], name: "index_activities_on_trip_id"
  end

  create_table "activity_bookings", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_bookings_on_activity_id"
    t.index ["day_id"], name: "index_activity_bookings_on_day_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.float "transport_to"
    t.float "transport_there"
    t.float "hotel"
    t.float "activities"
    t.float "food_drink"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_budgets_on_trip_id"
  end

  create_table "days", force: :cascade do |t|
    t.integer "number"
    t.date "starting_hour"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_days_on_trip_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "title"
    t.float "amount"
    t.bigint "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
  end

  create_table "food_drink_bookings", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "food_drink_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_food_drink_bookings_on_day_id"
    t.index ["food_drink_id"], name: "index_food_drink_bookings_on_food_drink_id"
  end

  create_table "food_drinks", force: :cascade do |t|
    t.string "title"
    t.string "occasion"
    t.string "address"
    t.float "price_person"
    t.string "photo"
    t.text "comment"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_food_drinks_on_trip_id"
  end

  create_table "hotel_bookings", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_hotel_bookings_on_day_id"
    t.index ["hotel_id"], name: "index_hotel_bookings_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "price_night_person"
    t.boolean "breakfast"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_hotels_on_trip_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.text "comment"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_ratings_on_trip_id"
  end

  create_table "there_transports", force: :cascade do |t|
    t.string "variety"
    t.integer "price_day_person"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_there_transports_on_trip_id"
  end

  create_table "to_transports", force: :cascade do |t|
    t.string "variety"
    t.integer "price_person"
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_to_transports_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.string "destination"
    t.string "photo"
    t.integer "number_people"
    t.date "start_date"
    t.text "comment"
    t.integer "activity_budget"
    t.integer "food_drink_budget"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "day"
    t.date "end_date"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "trips"
  add_foreign_key "activity_bookings", "activities"
  add_foreign_key "activity_bookings", "days"
  add_foreign_key "budgets", "trips"
  add_foreign_key "days", "trips"
  add_foreign_key "expenses", "budgets"
  add_foreign_key "food_drink_bookings", "days"
  add_foreign_key "food_drink_bookings", "food_drinks"
  add_foreign_key "food_drinks", "trips"
  add_foreign_key "hotel_bookings", "days"
  add_foreign_key "hotel_bookings", "hotels"
  add_foreign_key "hotels", "trips"
  add_foreign_key "ratings", "trips"
  add_foreign_key "there_transports", "trips"
  add_foreign_key "to_transports", "trips"
  add_foreign_key "trips", "users"
end
