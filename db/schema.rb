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

ActiveRecord::Schema.define(version: 2019_11_27_085459) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.integer "change_value"
    t.string "add_or_take"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_admin_points_on_student_id"
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "c_body"
    t.bigint "question_id"
    t.bigint "corporation_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporation_id"], name: "index_comments_on_corporation_id"
    t.index ["question_id"], name: "index_comments_on_question_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
  end

  create_table "corporations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "locate"
    t.integer "start_year"
    t.integer "number_of_employee"
    t.text "what_we_do"
    t.text "attractive_point"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_corporations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_corporations_on_reset_password_token", unique: true
  end

  create_table "event_apply_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "event_id"
    t.integer "student_id"
    t.boolean "has_paid"
    t.boolean "pay_point"
    t.boolean "pay_cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "school_id"
    t.integer "event_id"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.boolean "check"
  end

  create_table "event_sub_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "sub_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_sub_tags_on_event_id"
    t.index ["sub_tag_id"], name: "index_event_sub_tags_on_sub_tag_id"
  end

  create_table "event_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_tags_on_event_id"
    t.index ["tag_id"], name: "index_event_tags_on_tag_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "event_name"
    t.text "event_title"
    t.text "event_description"
    t.string "event_location"
    t.string "event_cost"
    t.date "event_time"
    t.string "event_time_detail"
    t.string "event_company_name"
    t.integer "event_population"
    t.string "event_president"
    t.string "event_president_birth_day"
    t.string "event_motto"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.string "event_select"
    t.integer "get_point"
    t.integer "pay_point"
    t.boolean "finish"
  end

  create_table "mini_event_apply_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mini_event_id"
    t.integer "student_id"
    t.boolean "has_paid"
    t.boolean "pay_point"
    t.boolean "pay_cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mini_event_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mini_event_id"
    t.integer "student_id"
    t.integer "school_id"
    t.string "name"
    t.string "email"
    t.string "phone_num"
    t.boolean "check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mini_event_styles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "mini_event_id"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mini_event_id"], name: "index_mini_event_styles_on_mini_event_id"
    t.index ["style_id"], name: "index_mini_event_styles_on_style_id"
  end

  create_table "mini_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "student_id"
    t.integer "corporation_id"
    t.text "detail"
    t.date "time"
    t.string "time_detail"
    t.integer "cost"
    t.text "requirement"
    t.integer "get_point"
    t.integer "pay_point"
    t.string "locate"
    t.integer "invite_num"
    t.text "mini_event_name"
    t.text "free_box"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "finish"
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "main_body"
    t.text "sub_body"
    t.boolean "open"
    t.string "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "non_profit_organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_ja"
    t.string "name_en"
    t.text "activity_detail_ja"
    t.text "performance_ja"
    t.text "activity_detail_en"
    t.text "performance_en"
    t.string "home_page_url"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_non_profit_organizations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_non_profit_organizations_on_reset_password_token", unique: true
  end

  create_table "points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "student_id"
    t.string "student_name"
    t.integer "max_point"
    t.integer "having_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "title"
    t.text "q_body"
    t.bigint "corporation_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corporation_id"], name: "index_questions_on_corporation_id"
    t.index ["student_id"], name: "index_questions_on_student_id"
  end

  create_table "quests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name"
    t.string "uuid"
    t.text "title"
    t.text "description"
    t.text "gift"
    t.text "gift_detail"
    t.text "dead_line"
    t.text "dead_line_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "school_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_ja"
    t.string "name_en"
    t.text "activity_detail_ja"
    t.text "performance_ja"
    t.text "activity_detail_en"
    t.text "performance_en"
    t.integer "membership"
    t.string "home_page_url"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_student_groups_on_email", unique: true
    t.index ["reset_password_token"], name: "index_student_groups_on_reset_password_token", unique: true
  end

  create_table "student_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "student_id"
    t.boolean "gold"
    t.boolean "silver"
    t.boolean "normal"
    t.boolean "ambassador"
    t.boolean "start_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "major_subject"
    t.integer "entrance_year"
    t.string "home_town"
    t.string "club"
    t.text "experienced_jobs"
    t.text "hobbies"
    t.text "introduction"
    t.text "free_space"
    t.string "sns_url"
    t.integer "school_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "style_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_style_events_on_event_id"
    t.index ["style_id"], name: "index_style_events_on_style_id"
  end

  create_table "styles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "uuid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sub_tag_name"
    t.string "sub_tag_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "uuid"
    t.string "tag_name"
    t.text "tag_info"
    t.text "tag_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_points", "students"
  add_foreign_key "comments", "questions"
  add_foreign_key "event_sub_tags", "events"
  add_foreign_key "event_sub_tags", "sub_tags"
  add_foreign_key "event_tags", "events"
  add_foreign_key "event_tags", "tags"
  add_foreign_key "mini_event_styles", "mini_events"
  add_foreign_key "mini_event_styles", "styles"
  add_foreign_key "style_events", "events"
  add_foreign_key "style_events", "styles"
end
