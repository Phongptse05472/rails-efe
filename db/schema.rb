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

ActiveRecord::Schema.define(version: 2020_07_01_050217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_progressions", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "article_id"
    t.time "time_point"
    t.boolean "is_viewed"
    t.time "updated_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "link_article"
    t.string "tag"
    t.time "duration"
    t.integer "number_complete"
    t.integer "view_number"
    t.boolean "is_free"
    t.boolean "is_favor"
    t.boolean "is_owner"
    t.text "link_file_attach"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment_history", default: ""
    t.integer "commentable_id"
    t.string "commentable_type"
    t.bigint "customer_id", null: false
    t.boolean "reply", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id"
  end

  create_table "course_articles", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "article_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_course_articles_on_article_id"
    t.index ["course_id"], name: "index_course_articles_on_course_id"
  end

  create_table "course_progressions", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "course_id"
    t.float "progression"
    t.integer "current_article_id"
    t.time "updated_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "name"
    t.text "image"
    t.text "description"
    t.boolean "is_free"
    t.boolean "is_save"
    t.boolean "is_owner"
    t.float "rate"
    t.integer "number_enrollment", limit: 2
    t.date "enrollment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_courses_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "role_id"
    t.string "name"
    t.string "phone_number"
    t.integer "roll_number"
    t.text "avatar"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "role_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_roles_on_customer_id"
    t.index ["role_id"], name: "index_roles_on_role_id"
  end

  create_table "topic_courses", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_topic_courses_on__id"
    t.index ["topic_id"], name: "index_topic_courses_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "customers"
end
