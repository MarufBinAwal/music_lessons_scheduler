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

ActiveRecord::Schema.define(version: 2019_06_17_170706) do

  create_table "availabilities", force: :cascade do |t|
    t.string "start_time"
    t.string "end_time"
    t.string "day"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "phone_number"
    t.string "email"
    t.string "instruments"
    t.string "pay_rate"
    t.text "biography"
    t.text "misc_notes"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "availability_id"
    t.integer "student_id"
    t.string "instrument"
    t.text "misc_notes"
    t.integer "price_of_lesson"
    t.string "user"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "phone_number"
    t.string "email"
    t.text "misc_notes"
    t.text "billing_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
