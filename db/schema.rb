# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_07_075317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment", id: :bigint, default: nil, force: :cascade do |t|
    t.string "address", limit: 255
    t.string "contact", limit: 255
    t.string "date", limit: 255, null: false
    t.string "department", limit: 255, null: false
    t.string "details", limit: 255
    t.string "doctor", limit: 255, null: false
    t.string "document", limit: 255
    t.string "email", limit: 255
    t.string "name", limit: 255
    t.datetime "now"
    t.bigint "patient_id", null: false
    t.string "sex", limit: 255
    t.string "status", limit: 255
    t.bigint "time", null: false
    t.bigint "timemm", null: false
  end

  create_table "boggles", force: :cascade do |t|
    t.string "word"
    t.string "alphabets_on_boggle"
    t.string "matrix_size"
  end

  create_table "doctor", primary_key: "did", id: :bigint, default: nil, force: :cascade do |t|
    t.string "dname", limit: 255
    t.string "dpass", limit: 255, null: false
    t.string "dphone", limit: 255
    t.string "dtype", limit: 255
    t.string "pp", limit: 255
  end

  create_table "document", id: :bigint, default: nil, force: :cascade do |t|
    t.string "docuemnt", limit: 255
  end

  create_table "patient", id: :bigint, default: nil, force: :cascade do |t|
    t.string "address", limit: 255
    t.string "contact", limit: 255
    t.string "date", limit: 255
    t.string "email", limit: 255
    t.string "name", limit: 255
    t.string "password", limit: 255
    t.string "pp", limit: 255
    t.string "sex", limit: 255
    t.string "token", limit: 255
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score"
  end

end
