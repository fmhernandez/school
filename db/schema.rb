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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120601172102) do

  create_table "centers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dayweeks", :force => true do |t|
    t.string   "dayname"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lounges", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_class_dayweeks", :force => true do |t|
    t.string   "student_class_id"
    t.string   "dayweek_id"
    t.string   "from_time"
    t.string   "to_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_class_students", :force => true do |t|
    t.integer  "student_id"
    t.integer  "student_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_class_teachers", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "student_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_classes", :force => true do |t|
    t.integer  "lounge_id"
    t.integer  "subject_id"
    t.string   "name"
    t.integer  "student_group_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_groups", :force => true do |t|
    t.integer  "student_id"
    t.integer  "studentclass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "surname1"
    t.string   "surname2"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_teachers", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.string   "dni"
    t.string   "name"
    t.string   "surname1"
    t.string   "surname2"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
