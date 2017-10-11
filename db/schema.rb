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

ActiveRecord::Schema.define(version: 20171003233407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "theme"
    t.text "guidelines"
    t.datetime "course_submissions_deadline"
    t.datetime "review_submissions_deadline"
    t.bigint "proposer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposer_id"], name: "index_challenges_on_proposer_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "bookmark"
    t.string "title"
    t.bigint "maker_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_courses_on_challenge_id"
    t.index ["maker_id"], name: "index_courses_on_maker_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "feedback"
    t.bigint "reviewer_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
