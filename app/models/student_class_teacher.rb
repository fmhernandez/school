# -*- encoding : utf-8 -*-
class StudentClassTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student_class
end
