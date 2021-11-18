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

ActiveRecord::Schema.define(version: 2021_11_13_124258) do

  create_table "casts", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_casts_on_character_id"
    t.index ["movie_id"], name: "index_casts_on_movie_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "url_picture"
    t.string "name"
    t.integer "age"
    t.decimal "weight"
    t.text "history"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "url_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "movie_or_serie"
    t.string "url_picture"
    t.string "title"
    t.date "debut_date"
    t.date "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "genre_id", null: false
    t.index ["genre_id"], name: "index_movies_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "casts", "characters"
  add_foreign_key "casts", "movies"
  add_foreign_key "movies", "genres"
end
