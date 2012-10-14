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

ActiveRecord::Schema.define(:version => 20121014194621) do

  create_table "businesses", :force => true do |t|
    t.string   "slug",         :null => false
    t.string   "name",         :null => false
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "url"
    t.string   "logo"
    t.text     "description"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "linkedin_url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "business_id"
    t.string   "door_number"
    t.string   "house_number",   :null => false
    t.string   "street_name",    :null => false
    t.string   "locality_id",    :null => false
    t.string   "region_id",      :null => false
    t.string   "postal_code_id", :null => false
    t.string   "country_id",     :null => false
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "wheres", :force => true do |t|
    t.string   "value"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
