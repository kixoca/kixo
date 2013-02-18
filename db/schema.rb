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

ActiveRecord::Schema.define(:version => 20130217161153) do

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
    t.text     "details",     :default => "", :null => false
    t.integer  "question_id", :default => 0,  :null => false
    t.integer  "author_id",   :default => 0,  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "classifications", :id => false, :force => true do |t|
    t.integer "classifiable_id",   :default => 0,   :null => false
    t.string  "classifiable_type", :default => "0", :null => false
    t.integer "taxonomy_id",       :default => 0,   :null => false
    t.string  "taxonomy_type",     :default => "0", :null => false
  end

  add_index "classifications", ["classifiable_id", "taxonomy_id"], :name => "index_classifications_on_classifiable_id_and_taxonomy_id"
  add_index "classifications", ["taxonomy_id", "classifiable_id"], :name => "index_classifications_on_taxonomy_id_and_classifiable_id"

  create_table "eager_beavers", :force => true do |t|
    t.string   "email",      :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "guides", :force => true do |t|
    t.string   "title",      :default => "", :null => false
    t.string   "excerpt",    :default => "", :null => false
    t.text     "content",    :default => "", :null => false
    t.integer  "status_id",  :default => 0,  :null => false
    t.integer  "author_id",  :default => 0,  :null => false
    t.integer  "locale_id",  :default => 0,  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "locales", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "code",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "locales", ["code"], :name => "index_locales_on_code", :unique => true

  create_table "localizations", :id => false, :force => true do |t|
    t.integer "localizable_id",   :default => 0,   :null => false
    t.string  "localizable_type", :default => "0", :null => false
    t.integer "locale_id",        :default => 0,   :null => false
  end

  add_index "localizations", ["locale_id", "localizable_id"], :name => "index_localizations_on_locale_id_and_localizable_id"
  add_index "localizations", ["localizable_id", "locale_id"], :name => "index_localizations_on_localizable_id_and_locale_id"

  create_table "messages", :force => true do |t|
    t.integer  "from_id",    :default => 0,     :null => false
    t.integer  "to_id",      :default => 0,     :null => false
    t.string   "content"
    t.boolean  "read",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",    :default => 0,     :null => false
    t.string   "message",    :default => "0",   :null => false
    t.string   "link_to"
    t.boolean  "seen",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "title",         :default => "", :null => false
    t.text     "details"
    t.integer  "status_id",     :default => 0,  :null => false
    t.integer  "visibility_id", :default => 0,  :null => false
    t.integer  "author_id",     :default => 0,  :null => false
    t.integer  "locale_id",     :default => 0,  :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "reviews", :force => true do |t|
    t.text     "comment",         :default => "", :null => false
    t.integer  "professional_id", :default => 0,  :null => false
    t.integer  "rating_id",       :default => 0,  :null => false
    t.integer  "author_id",       :default => 0,  :null => false
    t.integer  "locale_id",       :default => 0,  :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "taxonomies", :force => true do |t|
    t.string  "type"
    t.integer "parent_id"
    t.integer "rank"
    t.float   "latitude"
    t.float   "longitude"
  end

  create_table "taxonomy_descriptions", :force => true do |t|
    t.string  "type"
    t.string  "description"
    t.integer "locale_id",   :default => 0, :null => false
    t.integer "taxonomy_id", :default => 0, :null => false
  end

  add_index "taxonomy_descriptions", ["locale_id", "description"], :name => "index_taxonomy_descriptions_on_locale_id_and_description"

  create_table "taxonomy_names", :force => true do |t|
    t.string  "type"
    t.string  "name"
    t.integer "locale_id",   :default => 0, :null => false
    t.integer "taxonomy_id", :default => 0, :null => false
  end

  add_index "taxonomy_names", ["locale_id", "name"], :name => "index_taxonomy_names_on_locale_id_and_name"

  create_table "users", :force => true do |t|
    t.string   "email",                       :default => "",    :null => false
    t.string   "encrypted_password",          :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "tel"
    t.text     "bio"
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.boolean  "is_a_professional",           :default => false, :null => false
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.integer  "locality_id",                 :default => 0,     :null => false
    t.integer  "region_id",                   :default => 0,     :null => false
    t.string   "postal_code"
    t.integer  "country_id",                  :default => 0,     :null => false
    t.integer  "locale_id",                   :default => 0,     :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "notify_of_kixo_news",         :default => true,  :null => false
    t.boolean  "notify_of_partner_news",      :default => true,  :null => false
    t.boolean  "notify_of_new_messages",      :default => true,  :null => false
    t.boolean  "notify_of_answers",           :default => true,  :null => false
    t.boolean  "notify_of_replies",           :default => true,  :null => false
    t.boolean  "notify_of_similar_questions", :default => false, :null => false
    t.boolean  "notify_of_questions",         :default => true,  :null => false
    t.boolean  "notify_of_other_answers",     :default => true,  :null => false
    t.integer  "referer_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "stripe_customer_id"
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
