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

ActiveRecord::Schema[7.0].define(version: 2022_12_02_105142) do
  create_table "job_attribute_answers", force: :cascade do |t|
    t.integer "job_attribute_id", null: false
    t.string "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.index ["job_attribute_id"], name: "index_job_attribute_answers_on_job_attribute_id"
    t.index ["job_id"], name: "index_job_attribute_answers_on_job_id"
  end

  create_table "job_attributes", force: :cascade do |t|
    t.integer "job_template_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_template_id"], name: "index_job_attributes_on_job_template_id"
  end

  create_table "job_templates", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_template_id"
    t.index ["job_template_id"], name: "index_jobs_on_job_template_id"
  end

  add_foreign_key "job_attribute_answers", "job_attributes"
  add_foreign_key "job_attributes", "job_templates"
end
