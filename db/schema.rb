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

ActiveRecord::Schema.define(version: 2020_11_13_021641) do

  create_table "address_types", force: :cascade do |t|
    t.string "description", null: false
    t.text "note"
    t.boolean "excluded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.integer "type_address_id"
    t.integer "person_id"
    t.boolean "excluded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_types", force: :cascade do |t|
    t.string "description", null: false
    t.text "note"
    t.boolean "excluded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "telephone"
    t.string "cell_phone"
    t.integer "contact_type_id"
    t.integer "person_id"
    t.boolean "excluded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname"
    t.string "email"
    t.string "telephone"
    t.string "rg"
    t.string "cpf"
    t.string "cnpj"
    t.string "ie"
    t.integer "shift_id"
    t.integer "user_id"
    t.boolean "excluded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "provider"
    t.boolean "client", default: true
    t.boolean "user"
  end

  create_table "shifts", force: :cascade do |t|
    t.string "description", null: false
    t.time "start_time"
    t.time "endtime_time"
    t.boolean "sunday"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "fourth"
    t.boolean "fifth"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "excluded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
