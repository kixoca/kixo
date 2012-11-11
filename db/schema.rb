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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121110223834) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true
  add_index "admin_users", ["unlock_token"], :name => "index_admin_users_on_unlock_token", :unique => true

  create_table "answers", :force => true do |t|
    t.text     "details",         :default => "", :null => false
    t.integer  "question_id",     :default => 0,  :null => false
    t.integer  "professional_id", :default => 0,  :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "slug",                       :null => false
    t.text     "description"
    t.integer  "locale_id",   :default => 0, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "guides", :force => true do |t|
    t.string   "title",           :default => "", :null => false
    t.string   "slug",            :default => "", :null => false
    t.string   "excerpt",         :default => "", :null => false
    t.string   "status",          :default => "", :null => false
    t.text     "content",         :default => "", :null => false
    t.integer  "topic_id",        :default => 0,  :null => false
    t.integer  "professional_id", :default => 0,  :null => false
    t.integer  "locale_id",       :default => 0,  :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "guides", ["slug"], :name => "index_guides_on_slug", :unique => true

  create_table "guides_topics", :id => false, :force => true do |t|
    t.integer "guide_id"
    t.integer "topic_id"
  end

  create_table "locales", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "code",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "locales", ["code"], :name => "index_locales_on_code", :unique => true

  create_table "professionals", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name",                   :default => "", :null => false
    t.string   "tel"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "locality",               :default => "", :null => false
    t.string   "region",                 :default => "", :null => false
    t.string   "postal_code"
    t.string   "country",                :default => "", :null => false
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.integer  "locale_id",              :default => 1,  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "professionals", ["email"], :name => "index_professionals_on_email", :unique => true
  add_index "professionals", ["reset_password_token"], :name => "index_professionals_on_reset_password_token", :unique => true

  create_table "professionals_professions", :id => false, :force => true do |t|
    t.integer "professional_id"
    t.integer "profession_id"
  end

  create_table "professionals_topics", :id => false, :force => true do |t|
    t.integer "professional_id"
    t.integer "topic_id"
  end

  create_table "professions", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.string   "slug",        :default => "", :null => false
    t.text     "description"
    t.integer  "category_id", :default => 0,  :null => false
    t.integer  "locale_id",   :default => 0,  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "professions", ["slug"], :name => "index_professions_on_slug", :unique => true

  create_table "questions", :force => true do |t|
    t.string   "title",      :default => "",  :null => false
    t.text     "details"
    t.string   "status",     :default => "0", :null => false
    t.integer  "user_id",    :default => 0,   :null => false
    t.integer  "locale_id",  :default => 0,   :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "questions_topics", :id => false, :force => true do |t|
    t.integer "question_id"
    t.integer "topic_id"
  end

  create_table "representants", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   :default => "", :null => false
    t.string   "tel"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.integer  "locale_id",              :default => 1,  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "representants", ["email"], :name => "index_representants_on_email", :unique => true
  add_index "representants", ["reset_password_token"], :name => "index_representants_on_reset_password_token", :unique => true

  create_table "reviews", :force => true do |t|
    t.text     "comment",         :default => "", :null => false
    t.integer  "rating",          :default => 0,  :null => false
    t.string   "status",          :default => "", :null => false
    t.integer  "professional_id", :default => 0,  :null => false
    t.integer  "user_id",         :default => 0,  :null => false
    t.integer  "locale_id",       :default => 1,  :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.string   "slug",        :default => "", :null => false
    t.text     "description"
    t.integer  "category_id", :default => 0,  :null => false
    t.integer  "locale_id",   :default => 0,  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "tel"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "locality",               :default => "", :null => false
    t.string   "region",                 :default => "", :null => false
    t.string   "postal_code"
    t.string   "country"
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.integer  "locale_id",              :default => 1,  :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
