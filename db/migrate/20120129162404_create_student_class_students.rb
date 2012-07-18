# -*- encoding : utf-8 -*-
class CreateStudentClassStudents < ActiveRecord::Migration
  def self.up
    create_table :student_class_students do |t|
      t.integer :student_id
      t.integer :student_class_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_class_students
  end
end
