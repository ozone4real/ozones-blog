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

ActiveRecord::Schema.define(version: 2019_10_14_062204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["category_id"], name: "index_article_categories_on_category_id"
  end

  create_table "article_stats", force: :cascade do |t|
    t.string "user_id"
    t.bigint "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["article_id", "user_id"], name: "index_article_stats_on_article_id_and_user_id", unique: true
    t.index ["article_id"], name: "index_article_stats_on_article_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "image_url"
    t.string "title"
    t.text "article_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "time_to_read"
    t.string "slug"
    t.integer "number_of_reads", default: 0
    t.bigint "user_id"
    t.index ["slug"], name: "index_articles_on_slug"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_reactions", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_reactions_on_comment_id"
    t.index ["user_id"], name: "index_comment_reactions_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.index ["followed_id"], name: "index_followers_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_followers_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_followers_on_follower_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "article_id"
    t.index ["article_id"], name: "index_likes_on_article_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "bio"
    t.string "image_url"
    t.boolean "is_admin", default: false
    t.string "full_name"
  end

  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "article_stats", "articles"
  add_foreign_key "articles", "users"
  add_foreign_key "comment_reactions", "comments"
  add_foreign_key "comment_reactions", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "articles"
  add_foreign_key "likes", "users"
end
