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

ActiveRecord::Schema[7.1].define(version: 2024_04_02_070690) do
  create_table "generate_numbers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "result"
    t.string "jackpot_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lottery_managerments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "lottery_ball_1", null: false
    t.integer "lottery_ball_2", null: false
    t.integer "lottery_ball_3", null: false
    t.integer "lottery_ball_4", null: false
    t.integer "lottery_ball_5", null: false
    t.integer "lottery_ball_6", null: false
    t.integer "lottery_ball_extra"
    t.integer "status"
    t.date "lottery_period", null: false
    t.integer "number_of_spins_per_week", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
