# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150512151855) do

  create_table "episodes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "season_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "embed",      limit: 65535
    t.text     "embed2",     limit: 65535
    t.text     "embed3",     limit: 65535
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug",       limit: 255
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
    t.text     "embed",           limit: 65535
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "imdbID",          limit: 255
    t.integer  "year",            limit: 4
    t.string   "rated",           limit: 255
    t.string   "released",        limit: 255
    t.string   "runtime",         limit: 255
    t.string   "director",        limit: 255
    t.string   "writer",          limit: 255
    t.string   "actors",          limit: 255
    t.string   "plot",            limit: 255
    t.string   "language",        limit: 255
    t.string   "country",         limit: 255
    t.string   "awards",          limit: 255
    t.string   "poster",          limit: 255
    t.string   "metascore",       limit: 255
    t.string   "imdbrating",      limit: 255
    t.string   "imdbvotes",       limit: 255
    t.integer  "genre_id",        limit: 4
    t.string   "header_image",    limit: 255
    t.boolean  "featured",        limit: 1
    t.string   "trailer",         limit: 255
    t.string   "slug",            limit: 255
    t.string   "gallery_image_1", limit: 255
    t.string   "gallery_image_2", limit: 255
    t.string   "gallery_image_3", limit: 255
    t.text     "embed2",          limit: 65535
    t.text     "embed3",          limit: 65535
    t.string   "bg_image",        limit: 255
  end

  add_index "posts", ["genre_id"], name: "index_posts_on_genre_id", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "siri_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "poster",     limit: 255
  end

  add_index "seasons", ["siri_id"], name: "index_seasons_on_siri_id", using: :btree

  create_table "siri_genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "siris", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "slug",            limit: 255
    t.string   "status",          limit: 255
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "imdbID",          limit: 255
    t.integer  "year",            limit: 4
    t.string   "rated",           limit: 255
    t.string   "released",        limit: 255
    t.string   "runtime",         limit: 255
    t.string   "director",        limit: 255
    t.string   "writer",          limit: 255
    t.string   "actors",          limit: 255
    t.string   "language",        limit: 255
    t.string   "country",         limit: 255
    t.string   "awards",          limit: 255
    t.string   "poster",          limit: 255
    t.string   "metascore",       limit: 255
    t.string   "imdbrating",      limit: 255
    t.string   "imdbvotes",       limit: 255
    t.text     "description",     limit: 65535
    t.integer  "siri_genre_id",   limit: 4
    t.string   "gallery_image_1", limit: 255
    t.string   "gallery_image_2", limit: 255
    t.string   "gallery_image_3", limit: 255
    t.string   "header_image",    limit: 255
    t.string   "bg_image",        limit: 255
  end

  add_index "siris", ["siri_genre_id"], name: "index_siris_on_siri_genre_id", using: :btree
  add_index "siris", ["slug"], name: "index_siris_on_slug", unique: true, using: :btree
  add_index "siris", ["user_id"], name: "index_siris_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "username",               limit: 255, default: "",    null: false
    t.boolean  "admin",                  limit: 1,   default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "episodes", "seasons"
  add_foreign_key "posts", "genres"
  add_foreign_key "posts", "users"
  add_foreign_key "seasons", "siris"
  add_foreign_key "siris", "siri_genres"
  add_foreign_key "siris", "users"
end
