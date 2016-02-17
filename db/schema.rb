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

ActiveRecord::Schema.define(version: 20160215041157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "customer_id"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.decimal  "total"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id", using: :btree

  create_table "tintjobs", force: true do |t|
    t.integer  "tint_id"
    t.integer  "job_id"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tint_name"
  end

  add_index "tintjobs", ["job_id"], name: "index_tintjobs_on_job_id", using: :btree
  add_index "tintjobs", ["tint_id"], name: "index_tintjobs_on_tint_id", using: :btree

  create_table "tints", force: true do |t|
    t.string   "name"
    t.date     "date_bought"
    t.date     "date_sold"
    t.decimal  "cost"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "length"
    t.string   "roll_number"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
