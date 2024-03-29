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

ActiveRecord::Schema[7.1].define(version: 2024_03_08_070107) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "privacy"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "blocked_users", force: :cascade do |t|
    t.integer "blocked_by_id"
    t.integer "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "article_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "reciever_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "likeable_type"
    t.integer "likeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "reciever_id"
    t.string "notification_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shared_articles", force: :cascade do |t|
    t.integer "article_id"
    t.integer "shared_by_id"
    t.integer "owned_by_id"
    t.string "status", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "otp"
    t.datetime "otp_sent_at"
    t.boolean "verification"
    t.string "profile_picture"
    t.string "cover_picture"
  end

  add_foreign_key "articles", "users"
  add_foreign_key "blocked_users", "users", column: "blocked_by_id"
  add_foreign_key "blocked_users", "users", column: "blocked_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "friendships", "users", column: "reciever_id"
  add_foreign_key "friendships", "users", column: "reciever_id"
  add_foreign_key "friendships", "users", column: "sender_id"
  add_foreign_key "friendships", "users", column: "sender_id"
  add_foreign_key "likes", "users"
  add_foreign_key "shared_articles", "articles"
  add_foreign_key "shared_articles", "users", column: "owned_by_id"
  add_foreign_key "shared_articles", "users", column: "shared_by_id"
end
