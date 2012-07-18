# -*- encoding : utf-8 -*-
class CreateStudentClassDayweeks < ActiveRecord::Migration
  def self.up
    create_table :student_class_dayweeks do |t|
      t.string :student_class_id
      t.string :dayweek_id
      t.string :from_time
      t.string :to_time

      t.timestamps
    end
  end

  def self.down
    drop_table :student_class_dayweeks
  end
end
