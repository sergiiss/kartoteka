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

ActiveRecord::Schema.define(version: 20200103201710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decrees", force: :cascade do |t|
    t.integer "identifier"
    t.string "name"
    t.date "date"
    t.integer "option", default: 0
    t.bigint "quality_control_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quality_control_id"], name: "index_decrees_on_quality_control_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.string "phone", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.date "completion_date"
    t.text "todo"
    t.integer "performed", default: 0
    t.bigint "decree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decree_id"], name: "index_paragraphs_on_decree_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "identifier"
    t.string "first_name", limit: 50
    t.string "middle_name", limit: 50
    t.string "last_name", limit: 50
    t.integer "age"
    t.string "address"
    t.string "phone", limit: 20
    t.text "diagnosis"
    t.date "operation_date"
    t.date "visit_date"
    t.date "next_visit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quality_controls", force: :cascade do |t|
    t.date "decree_date"
    t.string "name"
    t.bigint "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_quality_controls_on_district_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
