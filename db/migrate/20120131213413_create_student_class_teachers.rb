# -*- encoding : utf-8 -*-
class CreateStudentClassTeachers < ActiveRecord::Migration
  def self.up
    create_table :student_class_teachers do |t|
      t.integer :teacher_id
      t.integer :student_class_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_class_teachers
  end
end
