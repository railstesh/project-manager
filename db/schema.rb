# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 2021_01_05_131000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'assigns', force: :cascade do |t|
    t.integer 'billing_hours'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.bigint 'project_id'
    t.integer 'assigned_as', default: 0
    t.bigint 'employee_id'
    t.datetime 'deleted_at'
    t.index ['deleted_at'], name: 'index_assigns_on_deleted_at'
    t.index ['employee_id'], name: 'index_assigns_on_employee_id'
    t.index ['project_id'], name: 'index_assigns_on_project_id'
    t.index ['user_id'], name: 'index_assigns_on_user_id'
  end

  create_table 'crediential_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'credientials', force: :cascade do |t|
    t.string 'url'
    t.string 'username'
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'project_id'
    t.bigint 'crediential_type_id'
    t.index ['crediential_type_id'], name: 'index_credientials_on_crediential_type_id'
    t.index ['project_id'], name: 'index_credientials_on_project_id'
  end

  create_table 'descriptions', force: :cascade do |t|
    t.string 'title'
    t.integer 'descriptable_id'
    t.string 'descriptable_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'employees', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'stack'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'deleted_at'
    t.integer 'status', default: 0
    t.text 'skills', default: [], array: true
    t.index ['deleted_at'], name: 'index_employees_on_deleted_at'
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'title'
    t.string 'client_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'work_limit'
    t.integer 'invoice_type', default: 0
    t.datetime 'deleted_at'
    t.bigint 'profile_id'
    t.bigint 'technology_id'
    t.text 'technologies', default: [], array: true
    t.boolean 'tracker'
    t.index ['deleted_at'], name: 'index_projects_on_deleted_at'
    t.index ['profile_id'], name: 'index_projects_on_profile_id'
    t.index ['technology_id'], name: 'index_projects_on_technology_id'
  end

  create_table 'technologies', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role', default: 0
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
