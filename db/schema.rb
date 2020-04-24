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

ActiveRecord::Schema.define(version: 2020_04_24_053405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_digests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "tweeted_on"
    t.json "raw_tweets", array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_daily_digests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "encrypted_twitter_consumer_key"
    t.string "encrypted_twitter_consumer_key_iv"
    t.string "encrypted_twitter_consumer_secret"
    t.string "encrypted_twitter_consumer_secret_iv"
    t.string "encrypted_twitter_access_token"
    t.string "encrypted_twitter_access_token_iv"
    t.string "encrypted_twitter_access_token_secret"
    t.string "encrypted_twitter_access_token_secret_iv"
    t.string "twitter_uid"
    t.string "twitter_nickname"
    t.string "twitter_name"
    t.string "twitter_image"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "daily_digests", "users"
end
