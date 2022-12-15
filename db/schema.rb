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

ActiveRecord::Schema[7.0].define(version: 2022_12_15_145543) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.string "veterinary_name"
    t.string "doctor_name"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
  end

  create_table "dewormings", force: :cascade do |t|
    t.string "name"
    t.integer "interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_dewormings_on_pet_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_exams_on_pet_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pet_id", null: false
    t.bigint "vaccine_id"
    t.bigint "deworming_id"
    t.bigint "treatment_id"
    t.bigint "appointment_id"
    t.index ["appointment_id"], name: "index_meetings_on_appointment_id"
    t.index ["deworming_id"], name: "index_meetings_on_deworming_id"
    t.index ["pet_id"], name: "index_meetings_on_pet_id"
    t.index ["treatment_id"], name: "index_meetings_on_treatment_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
    t.index ["vaccine_id"], name: "index_meetings_on_vaccine_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.date "birthday"
    t.string "gender"
    t.integer "weight"
    t.boolean "spayed"
    t.string "allergies"
    t.string "color"
    t.boolean "chiped"
    t.string "specie"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.date "last_application"
    t.integer "interval"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "until"
    t.index ["pet_id"], name: "index_treatments_on_pet_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "name"
    t.integer "interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_vaccines_on_pet_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "pets"
  add_foreign_key "dewormings", "pets"
  add_foreign_key "exams", "pets"
  add_foreign_key "meetings", "appointments"
  add_foreign_key "meetings", "dewormings"
  add_foreign_key "meetings", "pets"
  add_foreign_key "meetings", "treatments"
  add_foreign_key "meetings", "users"
  add_foreign_key "meetings", "vaccines"
  add_foreign_key "pets", "users"
  add_foreign_key "treatments", "pets"
  add_foreign_key "vaccines", "pets"
end
