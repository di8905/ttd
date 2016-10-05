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

ActiveRecord::Schema.define(version: 20161004114137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriages", force: :cascade do |t|
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "train_id"
    t.string   "type"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "seats"
    t.integer  "number"
    t.index ["id", "type"], name: "index_carriages_on_id_and_type", using: :btree
    t.index ["train_id"], name: "index_carriages_on_train_id", using: :btree
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "position"
    t.time    "departure"
    t.time    "arrival"
    t.integer "route_id"
    t.integer "railway_station_id"
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id", using: :btree
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id", using: :btree
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "departure_station_id"
    t.integer  "destination_station_id"
    t.string   "credentials"
    t.integer  "passport_number"
    t.index ["departure_station_id"], name: "index_tickets_on_departure_station_id", using: :btree
    t.index ["destination_station_id"], name: "index_tickets_on_destination_station_id", using: :btree
    t.index ["train_id"], name: "index_tickets_on_train_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "carriage_sort_order"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
    t.index ["route_id"], name: "index_trains_on_route_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
