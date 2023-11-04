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

ActiveRecord::Schema.define(version: 2020_10_29_000351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_operations", force: :cascade do |t|
    t.float "value", default: 0.0, null: false
    t.date "date_operation", default: -> { "CURRENT_DATE" }, null: false
    t.string "operation", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_account_operations_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "account_number", null: false
    t.string "name", default: "", null: false
    t.date "birth_date", default: -> { "CURRENT_DATE" }, null: false
    t.string "password_digest", default: "", null: false
    t.float "current_balance", default: 0.0, null: false
    t.float "previous_balance", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  add_foreign_key "account_operations", "accounts"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
