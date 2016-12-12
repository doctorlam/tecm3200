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

ActiveRecord::Schema.define(version: 20161212200252) do

  create_table "abouts", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "materials"
    t.text     "vital"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "user_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.date     "deadline"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "submission_id"
    t.integer  "homework_id"
    t.integer  "score"
    t.integer  "user_id"
  end

  create_table "classactivities", force: :cascade do |t|
    t.integer  "lesson_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.string   "creator_type"
    t.integer  "creator_id"
    t.string   "editor_type"
    t.integer  "editor_id"
    t.integer  "thread_id",                     null: false
    t.text     "body",                          null: false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   default: 0
    t.integer  "cached_votes_down", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_comments", ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
  add_index "commontator_comments", ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
  add_index "commontator_comments", ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string   "subscriber_type", null: false
    t.integer  "subscriber_id",   null: false
    t.integer  "thread_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
  add_index "commontator_subscriptions", ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"

  create_table "commontator_threads", force: :cascade do |t|
    t.string   "commontable_type"
    t.integer  "commontable_id"
    t.datetime "closed_at"
    t.string   "closer_type"
    t.integer  "closer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true

  create_table "course_infos", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "about_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.string   "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "criteria", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  create_table "deliverables", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  create_table "gradecategories", force: :cascade do |t|
    t.text     "description"
    t.integer  "grade_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "grades", force: :cascade do |t|
    t.text     "name"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.integer  "lesson_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "assignment_id"
  end

  create_table "learnings", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "project_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "assignment_id"
    t.integer  "presentation_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.integer  "week"
    t.date     "date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "project_id"
    t.string   "anotherdocument_file_name"
    t.string   "anotherdocument_content_type"
    t.integer  "anotherdocument_file_size"
    t.datetime "anotherdocument_updated_at"
    t.string   "document2_file_name"
    t.string   "document2_content_type"
    t.integer  "document2_file_size"
    t.datetime "document2_updated_at"
    t.integer  "presentation_id"
  end

  create_table "materials", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "about_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.integer  "lesson_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "about_id"
  end

  create_table "portals", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "presentations", force: :cascade do |t|
    t.string   "name"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lesson_id"
    t.integer  "user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "readings", force: :cascade do |t|
    t.integer  "lesson_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relateds", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "last_poster_id"
    t.time     "last_post_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  add_index "responses", ["post_id"], name: "index_responses_on_post_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "rubrics", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "project_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "score"
    t.integer  "totalscore"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "feedback"
    t.string   "total"
    t.string   "assignment_name"
    t.integer  "student_id"
    t.integer  "instructor_id"
    t.integer  "creator_id"
  end

  create_table "takeaways", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lesson_id"
  end

  create_table "turnins", force: :cascade do |t|
    t.integer  "homework_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.boolean  "admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "phonenumber"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vitals", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "about_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
