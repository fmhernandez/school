class CreateSubjectTeachers < ActiveRecord::Migration
  def self.up
    create_table :subject_teachers do |t|
      t.integer :teacher_id
      t.integer :subject_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subject_teachers
  end
end
