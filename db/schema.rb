# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_17_165945) do

  create_table "des_preferences", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "preference_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preference_id"], name: "index_des_preferences_on_preference_id"
    t.index ["user_id"], name: "index_des_preferences_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "preference"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "survery_answers", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.integer "user_id", null: false
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "step"
    t.index ["survey_id"], name: "index_survery_answers_on_survey_id"
    t.index ["user_id"], name: "index_survery_answers_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.string "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "des_preferences", "preferences"
  add_foreign_key "des_preferences", "users"
  add_foreign_key "survery_answers", "surveys"
  add_foreign_key "survery_answers", "users"
end
