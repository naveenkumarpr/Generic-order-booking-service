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

ActiveRecord::Schema.define(version: 2022_02_11_051320) do

  create_table "addresses", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobile"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "pincode"
    t.string "state"
    t.string "country"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "purchase_id", null: false
    t.index ["purchase_id"], name: "index_addresses_on_purchase_id"
  end

  create_table "customers", charset: "latin1", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "mobile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_methods", charset: "latin1", force: :cascade do |t|
    t.string "payment_mode"
    t.float "amount"
    t.string "transaction_reference_number"
    t.datetime "transaction_at"
    t.bigint "purchase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_payment_methods_on_purchase_id"
  end

  create_table "purchase_items", charset: "latin1", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.string "product_code"
    t.string "product_name"
    t.float "unit_product_mrp"
    t.float "unit_product_discount"
    t.float "unit_product_amount"
    t.float "total_final_amount"
    t.integer "quantity"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_purchase_items_on_purchase_id"
  end

  create_table "purchases", charset: "latin1", force: :cascade do |t|
    t.string "order_number"
    t.bigint "customer_id", null: false
    t.datetime "order_placed_at"
    t.string "vertical_code"
    t.float "total_mrp"
    t.float "total_discount"
    t.float "total_final_amount"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
  end

  add_foreign_key "addresses", "purchases"
  add_foreign_key "payment_methods", "purchases"
  add_foreign_key "purchase_items", "purchases"
  add_foreign_key "purchases", "customers"
end
