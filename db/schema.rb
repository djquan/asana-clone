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

ActiveRecord::Schema.define(version: 20131112213836) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["task_id"], name: "index_assignments_on_task_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "attachments", force: :cascade do |t|
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "task_attachment_file_name"
    t.string   "task_attachment_content_type"
    t.integer  "task_attachment_file_size"
    t.datetime "task_attachment_updated_at"
  end

  add_index "attachments", ["task_id"], name: "index_attachments_on_task_id"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "commenter_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id"
  add_index "comments", ["task_id"], name: "index_comments_on_task_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id",    default: 0
  end

  add_index "projects", ["name"], name: "index_projects_on_name"
  add_index "projects", ["owner_id"], name: "index_projects_on_owner_id"
  add_index "projects", ["team_id"], name: "index_projects_on_team_id"

  create_table "tag_tasks", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_tasks", ["tag_id"], name: "index_tag_tasks_on_tag_id"
  add_index "tag_tasks", ["task_id"], name: "index_tag_tasks_on_task_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name"

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.string   "name"
    t.boolean  "completed",   default: false
    t.date     "due"
    t.integer  "project_id"
    t.integer  "parent_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
    t.boolean  "starred",     default: false
  end

  add_index "tasks", ["creator_id"], name: "index_tasks_on_creator_id"
  add_index "tasks", ["name"], name: "index_tasks_on_name"
  add_index "tasks", ["parent_id"], name: "index_tasks_on_parent_id"
  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["starred"], name: "index_tasks_on_starred"

  create_table "team_lists", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_lists", ["team_id", "user_id"], name: "index_team_lists_on_team_id_and_user_id", unique: true
  add_index "team_lists", ["team_id"], name: "index_team_lists_on_team_id"
  add_index "team_lists", ["user_id"], name: "index_team_lists_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], name: "index_teams_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["name"], name: "index_users_on_name"

end
