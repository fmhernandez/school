# -*- encoding : utf-8 -*-
class Teacher < ActiveRecord::Base
   validates :dni, :name, :surname1, :surname2, :phone1, :address, :presence=> true  
   has_many :student_class_teachers
   has_many :student_classes, :through =>:student_class_teachers  
   has_many :subject_teachers
   has_many :subjects, :through => :subject_teachers
   def teacher_collection_select_data
     name+" "+surname1+" "+surname2
   end
end
