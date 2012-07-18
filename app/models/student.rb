# -*- encoding : utf-8 -*-
class Student < ActiveRecord::Base
   validates :name, :surname1, :surname2, :phone1, :presence=> true

   has_many :student_class_students
   has_many :student_classes, :through =>:student_class_students
end
