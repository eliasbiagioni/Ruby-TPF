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

ActiveRecord::Schema.define(version: 2020_02_16_200453) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer "rater_id"
    t.string "rateable_type"
    t.integer "rateable_id"
    t.float "avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_average_caches_on_rater_id"
  end

  create_table "book_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_categories_books", id: false, force: :cascade do |t|
    t.integer "book_category_id", null: false
    t.integer "book_id", null: false
    t.index ["book_category_id", "book_id"], name: "index_join_book_categories"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.integer "isbn", null: false
    t.string "author", null: false
    t.string "editorial", null: false
    t.text "summary", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "books_catalogs", id: false, force: :cascade do |t|
    t.integer "catalog_id", null: false
    t.integer "book_id", null: false
    t.index ["catalog_id", "book_id"], name: "index_join_catalogs_books"
  end

  create_table "catalog_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catalogs", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "privacy", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "catalog_category_id"
    t.integer "user_id"
    t.index ["catalog_category_id"], name: "index_catalogs_on_catalog_category_id"
    t.index ["user_id"], name: "index_catalogs_on_user_id"
  end

  create_table "catalogs_movies", id: false, force: :cascade do |t|
    t.integer "catalog_id", null: false
    t.integer "movie_id", null: false
    t.index ["catalog_id", "movie_id"], name: "index_join_catalogs_movies"
  end

  create_table "catalogs_music_discs", id: false, force: :cascade do |t|
    t.integer "catalog_id", null: false
    t.integer "music_disc_id", null: false
    t.index ["catalog_id", "music_disc_id"], name: "index_join_catalog_music_disc"
  end

  create_table "movie_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_categories_movies", id: false, force: :cascade do |t|
    t.integer "movie_category_id", null: false
    t.integer "movie_id", null: false
    t.index ["movie_category_id", "movie_id"], name: "index_join_movie_categories"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.text "actors", null: false
    t.text "directors", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "music_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "music_categories_discs", id: false, force: :cascade do |t|
    t.integer "music_category_id", null: false
    t.integer "music_disc_id", null: false
    t.index ["music_category_id", "music_disc_id"], name: "index_join_music_d_categories"
  end

  create_table "music_discs", force: :cascade do |t|
    t.string "title", null: false
    t.string "discography", null: false
    t.string "group_name", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_music_discs_on_user_id"
  end

  create_table "music_discs_songs", id: false, force: :cascade do |t|
    t.integer "music_disc_id", null: false
    t.integer "song_id", null: false
    t.index ["music_disc_id", "song_id"], name: "index_join_music_discs"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.integer "target_id"
    t.string "second_target_type"
    t.integer "second_target_id"
    t.string "third_target_type"
    t.integer "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string "rateable_type"
    t.integer "rateable_id"
    t.float "overall_avg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "rater_id"
    t.string "rateable_type"
    t.integer "rateable_id"
    t.float "stars", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string "cacheable_type"
    t.integer "cacheable_id"
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "music_category_id"
    t.index ["music_category_id"], name: "index_songs_on_music_category_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "songs_categories", force: :cascade do |t|
    t.integer "song_id"
    t.integer "music_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_category_id"], name: "index_songs_categories_on_music_category_id"
    t.index ["song_id"], name: "index_songs_categories_on_song_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
