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

ActiveRecord::Schema[7.0].define(version: 2023_03_24_142443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "breed"
    t.string "gender"
    t.integer "weight", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "archived", default: false
    t.index ["user_id"], name: "index_animals_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "animal_id"
    t.bigint "user_id"
    t.bigint "slot_id"
    t.text "reason_for_appointment"
    t.bigint "vet_id"
    t.index ["animal_id"], name: "index_appointments_on_animal_id"
    t.index ["slot_id"], name: "index_appointments_on_slot_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
    t.index ["vet_id"], name: "index_appointments_on_vet_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "frequency_to_give_per_day"
    t.integer "quantity_dispensed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "animal_id"
    t.bigint "vet_id"
    t.index ["animal_id"], name: "index_medications_on_animal_id"
    t.index ["vet_id"], name: "index_medications_on_vet_id"
  end

  create_table "slots", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animals", "users"
  add_foreign_key "appointments", "animals"
  add_foreign_key "appointments", "slots"
  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "vets"
  add_foreign_key "medications", "animals"
  add_foreign_key "medications", "vets"
end
