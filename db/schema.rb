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

ActiveRecord::Schema.define(version: 2021_03_02_222457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "vertical_id"
    t.string "name"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vertical_id"], name: "index_categories_on_vertical_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.string "author"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "opro_auth_grants", force: :cascade do |t|
    t.string "code"
    t.string "access_token"
    t.string "refresh_token"
    t.text "permissions"
    t.datetime "access_token_expires_at"
    t.integer "user_id"
    t.integer "application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_opro_auth_grants_on_access_token", unique: true
    t.index ["code"], name: "index_opro_auth_grants_on_code", unique: true
    t.index ["refresh_token"], name: "index_opro_auth_grants_on_refresh_token", unique: true
  end

  create_table "opro_client_apps", force: :cascade do |t|
    t.string "name"
    t.string "app_id"
    t.string "app_secret"
    t.text "permissions"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id", "app_secret"], name: "index_opro_client_apps_on_app_id_and_app_secret", unique: true
    t.index ["app_id"], name: "index_opro_client_apps_on_app_id", unique: true
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

  create_table "verticals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
