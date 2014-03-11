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

ActiveRecord::Schema.define(version: 20140311184155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "postings", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
  end

  add_index "postings", ["user_id", "created_at"], name: "index_postings_on_user_id_and_created_at", using: :btree

  create_table "supertag_hashtaggings", force: true do |t|
    t.integer "hashtag_id"
    t.integer "hashtaggable_id"
    t.string  "hashtaggable_type"
  end

  add_index "supertag_hashtaggings", ["hashtag_id"], name: "index_supertag_hashtaggings_on_hashtag_id", using: :btree
  add_index "supertag_hashtaggings", ["hashtaggable_id", "hashtaggable_type"], name: "index_hashtaggings_hashtaggable_id_hashtaggable_type", using: :btree

  create_table "supertag_hashtags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supertag_moneytaggings", force: true do |t|
    t.integer "moneytag_id"
    t.integer "moneytaggable_id"
    t.string  "moneytaggable_type"
  end

  add_index "supertag_moneytaggings", ["moneytag_id"], name: "index_supertag_moneytaggings_on_moneytag_id", using: :btree
  add_index "supertag_moneytaggings", ["moneytaggable_id", "moneytaggable_type"], name: "index_moneytaggings_moneytaggable_id_moneytaggable_type", using: :btree

  create_table "supertag_moneytags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supertag_taggings", force: true do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string  "taggable_type"
  end

  add_index "supertag_taggings", ["tag_id"], name: "index_supertag_taggings_on_tag_id", using: :btree
  add_index "supertag_taggings", ["taggable_id", "taggable_type"], name: "index_taggings_taggable_id_taggable_type", using: :btree

  create_table "supertag_tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supertag_usertaggings", force: true do |t|
    t.integer "usertag_id"
    t.integer "usertaggable_id"
    t.string  "usertaggable_type"
  end

  add_index "supertag_usertaggings", ["usertag_id"], name: "index_supertag_usertaggings_on_usertag_id", using: :btree
  add_index "supertag_usertaggings", ["usertaggable_id", "usertaggable_type"], name: "index_usertaggings_usertaggable_id_usertaggable_type", using: :btree

  create_table "supertag_usertags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
