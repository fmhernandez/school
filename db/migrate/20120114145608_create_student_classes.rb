# -*- encoding : utf-8 -*-
class CreateStudentClasses < ActiveRecord::Migration
  def self.up
    create_table :student_classes do |t|
      t.integer :lounge_id
      t.integer :subject_id
      t.string  :name
      t.integer :student_group_id
      t.string  :description

      t.timestamps
    end
  end

  def self.down
    drop_table :student_classes
  end
end
