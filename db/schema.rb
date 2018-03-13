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

ActiveRecord::Schema.define(version: 20180313141017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "zip", null: false
    t.string "country", null: false
    t.string "phone", null: false
    t.integer "kind", null: false
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "author_id"
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.decimal "width", precision: 5, scale: 1
    t.decimal "height", precision: 5, scale: 1
    t.decimal "depth", precision: 5, scale: 1
    t.string "material"
    t.integer "publication_year"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code", null: false
    t.decimal "sale", precision: 5, scale: 2, null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_coupons_on_order_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "number", null: false
    t.integer "cvv", null: false
    t.integer "expiration_month", null: false
    t.integer "expiration_year", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.index ["book_id"], name: "index_images_on_book_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "quantity", null: false
    t.bigint "book_id"
    t.bigint "order_id"
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total_price", precision: 6, scale: 2
    t.date "completed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "state", default: 0, null: false
    t.bigint "credit_card_id"
    t.boolean "use_billing", default: false
    t.index ["credit_card_id"], name: "index_orders_on_credit_card_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment_text", default: "", null: false
    t.string "name", default: "", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.bigint "user_id"
    t.boolean "confirmed", default: false
    t.boolean "verified", default: false
    t.string "avatar"
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
