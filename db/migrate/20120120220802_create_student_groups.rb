# -*- encoding : utf-8 -*-
class CreateStudentGroups < ActiveRecord::Migration
  def self.up
    create_table :student_groups do |t|
      t.integer :student_id
      t.integer :studentclass_id

      t.timestamps
    end
  end

  def self.down
    drop_table :student_groups
  end
end
