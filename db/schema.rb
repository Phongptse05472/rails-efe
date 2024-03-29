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

ActiveRecord::Schema.define(version: 2020_10_07_070156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "article_los", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "lo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_los_on_article_id"
    t.index ["lo_id"], name: "index_article_los_on_lo_id"
  end

  create_table "article_skills", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "skill_id"
    t.bigint "level_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_skills_on_article_id"
    t.index ["level_id"], name: "index_article_skills_on_level_id"
    t.index ["skill_id"], name: "index_article_skills_on_skill_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.time "duration"
    t.bigint "view_number"
    t.boolean "is_free"
    t.text "link_file_attach"
    t.text "video"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date_created"
  end

  create_table "careerpaths", force: :cascade do |t|
    t.string "name"
    t.string "rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "customer_id"
    t.text "content"
    t.integer "parent_id"
    t.boolean "is_pin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
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

  create_table "course_groups", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_groups_on_course_id"
    t.index ["group_id"], name: "index_course_groups_on_group_id"
  end

  create_table "course_preskills", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "skill_id"
    t.integer "level_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_preskills_on_course_id"
    t.index ["skill_id"], name: "index_course_preskills_on_skill_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "image"
    t.text "description"
    t.string "author"
    t.boolean "is_free"
    t.float "rate"
    t.boolean "is_active", default: true
    t.bigint "number_enrollment"
    t.float "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.string "lo"
    t.index ["slug"], name: "index_courses_on_slug", unique: true
  end

  create_table "customer_articles", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "article_id"
    t.boolean "is_owner"
    t.float "time_point"
    t.boolean "is_viewed"
    t.boolean "is_favor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_customer_articles_on_article_id"
    t.index ["customer_id"], name: "index_customer_articles_on_customer_id"
  end

  create_table "customer_courses", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "course_id"
    t.boolean "is_owner"
    t.boolean "is_save", default: false
    t.integer "current_article_id"
    t.float "progression", default: 0.0
    t.date "enrollment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_customer_courses_on_course_id"
    t.index ["customer_id"], name: "index_customer_courses_on_customer_id"
  end

  create_table "customer_los", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "lo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id", "lo_id"], name: "index_customer_los_on_customer_id_and_lo_id", unique: true
    t.index ["customer_id"], name: "index_customer_los_on_customer_id"
    t.index ["lo_id"], name: "index_customer_los_on_lo_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.string "name"
    t.string "phone_number"
    t.integer "roll_number"
    t.text "avatar"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_customers_on_role_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "customers_paths", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "careerpath_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["careerpath_id"], name: "index_customers_paths_on_careerpath_id"
    t.index ["customer_id"], name: "index_customers_paths_on_customer_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_groups_on_slug", unique: true
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lo_los", force: :cascade do |t|
    t.bigint "lo_id"
    t.bigint "lo_req_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lo_id"], name: "index_lo_los_on_lo_id"
    t.index ["lo_req_id"], name: "index_lo_los_on_lo_req_id"
  end

  create_table "los", force: :cascade do |t|
    t.string "name"
    t.bigint "skill_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_los_on_skill_id"
  end

  create_table "path_groups", force: :cascade do |t|
    t.bigint "careerpath_id"
    t.bigint "group_id"
    t.bigint "level_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["careerpath_id"], name: "index_path_groups_on_careerpath_id"
    t.index ["group_id"], name: "index_path_groups_on_group_id"
    t.index ["level_id"], name: "index_path_groups_on_level_id"
  end

  create_table "path_los", force: :cascade do |t|
    t.bigint "careerpath_id"
    t.bigint "lo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["careerpath_id"], name: "index_path_los_on_careerpath_id"
    t.index ["lo_id"], name: "index_path_los_on_lo_id"
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

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_skills_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "lo_los", "los", column: "lo_req_id"
end
