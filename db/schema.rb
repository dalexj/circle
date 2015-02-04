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

ActiveRecord::Schema.define(version: 20_150_201_202_447) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'inner_circles', force: true do |t|
    t.string 'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'user_id'
  end

  add_index 'inner_circles', ['user_id'], name: 'index_inner_circles_on_user_id', using: :btree

  create_table 'user_follow_connections', force: true do |t|
    t.integer 'owner_id'
    t.integer 'follower_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'users', force: true do |t|
    t.string 'email_address'
    t.string 'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'password_digest'
    t.boolean 'admin'
    t.boolean 'owner'
    t.string 'linkedin_url'
    t.string 'slug'
    t.boolean 'candidate'
    t.string 'resume_file_name'
    t.string 'resume_content_type'
    t.integer 'resume_file_size'
    t.datetime 'resume_updated_at'
  end
end
