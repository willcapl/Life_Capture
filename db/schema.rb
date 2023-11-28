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

ActiveRecord::Schema[7.1].define(version: 2023_11_28_155559) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlists", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "sub_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: [], array: true
    t.index ["sub_user_id"], name: "index_questions_on_sub_user_id"
  end

  create_table "response_bookmarks", force: :cascade do |t|
    t.bigint "response_id", null: false
    t.bigint "playlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_response_bookmarks_on_playlist_id"
    t.index ["response_id"], name: "index_response_bookmarks_on_response_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "sub_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "relationship_to_user"
    t.date "dob"
    t.string "childhood_location"
    t.string "post_education"
    t.string "birthplace"
    t.string "career"
    t.string "adult_life_location"
    t.string "hobbies"
    t.string "life_after_retirement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sub_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "sub_users"
  add_foreign_key "response_bookmarks", "playlists"
  add_foreign_key "response_bookmarks", "responses"
  add_foreign_key "responses", "questions"
  add_foreign_key "sub_users", "users"
end
