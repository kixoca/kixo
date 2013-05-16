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

ActiveRecord::Schema.define(:version => 20130515223638) do

  create_table "ad_clicks", :force => true do |t|
    t.integer  "ad_id",      :default => 0, :null => false
    t.integer  "locale_id",  :default => 0, :null => false
    t.integer  "clicker_id"
    t.string   "ip"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "ad_views", :force => true do |t|
    t.integer  "ad_id",      :default => 0, :null => false
    t.integer  "locale_id",  :default => 0, :null => false
    t.integer  "viewer_id"
    t.string   "ip"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "ads", :force => true do |t|
    t.integer  "advertiser_id"
    t.integer  "locale_id",           :default => 0, :null => false
    t.string   "format"
    t.string   "visual_file_name"
    t.string   "visual_content_type"
    t.integer  "visual_file_size"
    t.datetime "visual_updated_at"
    t.string   "destination"
    t.integer  "views_count",         :default => 0, :null => false
    t.integer  "clicks_count",        :default => 0, :null => false
    t.integer  "max_views"
    t.integer  "max_clicks"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "expires_at"
    t.datetime "deleted_at"
  end

  create_table "answers", :force => true do |t|
    t.text     "answer",         :default => "", :null => false
    t.integer  "question_id",    :default => 0,  :null => false
    t.integer  "author_id",      :default => 0,  :null => false
    t.integer  "comments_count", :default => 0,  :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.datetime "deleted_at"
  end

  create_table "classifications", :force => true do |t|
    t.integer "classifiable_id",   :default => 0,   :null => false
    t.string  "classifiable_type", :default => "0", :null => false
    t.integer "taxonomy_id",       :default => 0,   :null => false
    t.string  "taxonomy_type",     :default => "0", :null => false
  end

  add_index "classifications", ["classifiable_id", "classifiable_type", "taxonomy_id", "taxonomy_type"], :name => "index_classifiable_taxonomy", :unique => true
  add_index "classifications", ["taxonomy_id", "taxonomy_type", "classifiable_id", "classifiable_type"], :name => "index_taxonomy_classifiable", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "comment",          :default => "",  :null => false
    t.integer  "commentable_id",   :default => 0,   :null => false
    t.string   "commentable_type", :default => "0", :null => false
    t.integer  "author_id",        :default => 0,   :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.datetime "deleted_at"
  end

  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "conversation_participations", :force => true do |t|
    t.integer  "conversation_id", :default => 0, :null => false
    t.integer  "participant_id",  :default => 0, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "conversation_participations", ["conversation_id", "participant_id"], :name => "index_conversation_participant", :unique => true
  add_index "conversation_participations", ["participant_id", "conversation_id"], :name => "index_participant_conversation", :unique => true

  create_table "conversations", :force => true do |t|
    t.integer  "messages_count", :default => 0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.datetime "deleted_at"
  end

  create_table "guides", :force => true do |t|
    t.string   "title",          :default => "", :null => false
    t.string   "excerpt",        :default => "", :null => false
    t.text     "content",        :default => "", :null => false
    t.integer  "status_id",      :default => 0,  :null => false
    t.integer  "author_id",      :default => 0,  :null => false
    t.integer  "locale_id",      :default => 0,  :null => false
    t.integer  "comments_count", :default => 0,  :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.datetime "deleted_at"
  end

  create_table "locales", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.string   "code",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "locales", ["code"], :name => "index_locales_on_code", :unique => true

  create_table "localizations", :force => true do |t|
    t.integer "localizable_id",   :default => 0,   :null => false
    t.string  "localizable_type", :default => "0", :null => false
    t.integer "locale_id",        :default => 0,   :null => false
  end

  add_index "localizations", ["locale_id", "localizable_id", "localizable_type"], :name => "index_locale_localizable", :unique => true
  add_index "localizations", ["localizable_id", "localizable_type", "locale_id"], :name => "index_localizable_locale", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "conversation_id", :default => 0,     :null => false
    t.integer  "author_id",       :default => 0,     :null => false
    t.boolean  "read",            :default => false, :null => false
    t.string   "message"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "deleted_at"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",    :default => 0,     :null => false
    t.string   "message",    :default => "0",   :null => false
    t.string   "link_to"
    t.boolean  "seen",       :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "meta_title"
    t.text     "meta_description"
    t.integer  "parent_id"
    t.integer  "locale_id",        :default => 0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.datetime "published_at"
    t.datetime "deleted_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title",          :default => "",    :null => false
    t.text     "details"
    t.boolean  "is_private",     :default => false, :null => false
    t.integer  "status_id",      :default => 0,     :null => false
    t.integer  "author_id",      :default => 0,     :null => false
    t.integer  "locale_id",      :default => 0,     :null => false
    t.integer  "locality_id",    :default => 0,     :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "answers_count",  :default => 0,     :null => false
    t.integer  "comments_count", :default => 0,     :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.datetime "deleted_at"
  end

  create_table "reviews", :force => true do |t|
    t.text     "comment",         :default => "", :null => false
    t.integer  "professional_id", :default => 0,  :null => false
    t.integer  "rating_id",       :default => 0,  :null => false
    t.integer  "author_id",       :default => 0,  :null => false
    t.integer  "locale_id",       :default => 0,  :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.datetime "deleted_at"
  end

  create_table "taxonomies", :force => true do |t|
    t.string  "type"
    t.integer "parent_id"
    t.integer "rank"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "users_count",       :default => 0, :null => false
    t.integer "questions_count",   :default => 0, :null => false
    t.integer "guides_count",      :default => 0, :null => false
    t.integer "categories_count",  :default => 0, :null => false
    t.integer "topics_count",      :default => 0, :null => false
    t.integer "professions_count", :default => 0, :null => false
    t.integer "countries_count",   :default => 0, :null => false
    t.integer "regions_count",     :default => 0, :null => false
    t.integer "localities_count",  :default => 0, :null => false
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
    t.boolean  "is_active",                   :default => true,  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_professional",             :default => false, :null => false
    t.boolean  "is_admin",                    :default => false, :null => false
    t.integer  "points",                      :default => 0,     :null => false
    t.string   "name"
    t.text     "bio"
    t.string   "company_name"
    t.string   "tel"
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "google_plus"
    t.string   "linkedin"
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.integer  "locality_id",                 :default => 0,     :null => false
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "locale_id",                   :default => 0,     :null => false
    t.string   "stripe_customer_id"
    t.boolean  "notify_of_kixo_news",         :default => true,  :null => false
    t.boolean  "notify_of_partner_news",      :default => true,  :null => false
    t.boolean  "notify_of_new_messages",      :default => true,  :null => false
    t.boolean  "notify_of_answers",           :default => true,  :null => false
    t.boolean  "notify_of_replies",           :default => true,  :null => false
    t.boolean  "notify_of_similar_questions", :default => false, :null => false
    t.boolean  "notify_of_questions",         :default => true,  :null => false
    t.boolean  "notify_of_other_answers",     :default => true,  :null => false
    t.integer  "referer_id"
    t.integer  "answers_count",               :default => 0,     :null => false
    t.integer  "questions_count",             :default => 0,     :null => false
    t.integer  "comments_count",              :default => 0,     :null => false
    t.integer  "reviews_count",               :default => 0,     :null => false
    t.integer  "referrals_count",             :default => 0,     :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.datetime "deleted_at"
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
