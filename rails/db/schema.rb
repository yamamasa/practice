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

ActiveRecord::Schema.define(version: 2021_05_04_052242) do

  create_table "account_roles", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id", "shop_id", "role_id"], name: "index_account_roles_on_account_id_and_shop_id_and_role_id", unique: true
    t.index ["account_id"], name: "index_account_roles_on_account_id"
    t.index ["role_id"], name: "index_account_roles_on_role_id"
    t.index ["shop_id"], name: "index_account_roles_on_shop_id"
  end

  create_table "accounts", charset: "utf8mb4", force: :cascade do |t|
    t.string "sub", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "picture_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sub"], name: "index_accounts_on_sub", unique: true
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "parent_id"
    t.integer "lft", default: 0, null: false
    t.integer "rgt", default: 0, null: false
    t.integer "depth", default: 0, null: false
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_categories_on_code", unique: true
    t.index ["depth"], name: "index_categories_on_depth"
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["rgt"], name: "index_categories_on_rgt"
  end

  create_table "roles", charset: "utf8mb4", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "parent_id"
    t.integer "lft", default: 0, null: false
    t.integer "rgt", default: 0, null: false
    t.string "code", null: false
    t.string "name", null: false
    t.integer "depth", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_shops_on_code", unique: true
    t.index ["depth"], name: "index_shops_on_depth"
    t.index ["lft"], name: "index_shops_on_lft"
    t.index ["rgt"], name: "index_shops_on_rgt"
  end

  add_foreign_key "account_roles", "accounts"
  add_foreign_key "account_roles", "roles"
  add_foreign_key "account_roles", "shops"
end
