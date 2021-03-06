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

ActiveRecord::Schema.define(version: 2019_11_21_053314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_areas_on_name", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "placements", force: :cascade do |t|
    t.integer "shelf_capacity"
    t.bigint "section_id", null: false
    t.bigint "product_id", null: false
    t.bigint "size_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_placements_on_product_id"
    t.index ["section_id", "product_id", "size_id"], name: "index_placements_on_section_id_and_product_id_and_size_id", unique: true
    t.index ["section_id"], name: "index_placements_on_section_id"
    t.index ["size_id"], name: "index_placements_on_size_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "descriptor"
    t.bigint "brand_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id", "name", "descriptor"], name: "index_products_on_brand_id_and_name_and_descriptor", unique: true
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "products_sizes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "size_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id", "size_id"], name: "index_products_sizes_on_product_id_and_size_id", unique: true
    t.index ["product_id"], name: "index_products_sizes_on_product_id"
    t.index ["size_id"], name: "index_products_sizes_on_size_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_sections_on_area_id"
    t.index ["name"], name: "index_sections_on_name", unique: true
  end

  create_table "sizes", force: :cascade do |t|
    t.string "description", null: false
    t.integer "average_shelf_capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["description"], name: "index_sizes_on_description", unique: true
  end

  add_foreign_key "placements", "products", on_delete: :cascade
  add_foreign_key "placements", "sections", on_delete: :cascade
  add_foreign_key "placements", "sizes", on_delete: :cascade
  add_foreign_key "products", "brands", on_delete: :cascade
  add_foreign_key "products_sizes", "products", on_delete: :cascade
  add_foreign_key "products_sizes", "sizes", on_delete: :cascade
  add_foreign_key "sections", "areas", on_delete: :cascade
end
