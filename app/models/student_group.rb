# -*- encoding : utf-8 -*-
class StudentGroup < ActiveRecord::Base
  #has_many :student_classes
  #has_many :students
  has_many :st_classes
  has_many :st  
end
