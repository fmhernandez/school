# -*- encoding : utf-8 -*-
class StudentClass < ActiveRecord::Base
   attr_accessor :Mon_check
   attr_accessor :Tue_check   
   attr_accessor :Wed_check   
   attr_accessor :Thu_check
   attr_accessor :Fri_check      
   attr_accessor :Sat_check      
   attr_accessor :Sun_check      
   attr_accessor :Mon_fromh
   attr_accessor :Mon_fromm   
   attr_accessor :Mon_toh      
   attr_accessor :Mon_tom
   attr_accessor :Tue_fromh
   attr_accessor :Tue_fromm   
   attr_accessor :Tue_toh
   attr_accessor :Tue_tom      
   attr_accessor :Wed_fromh
   attr_accessor :Wed_fromm
   attr_accessor :Wed_toh
   attr_accessor :Wed_tom   
   attr_accessor :Thu_fromh
   attr_accessor :Thu_fromm   
   attr_accessor :Thu_toh
   attr_accessor :Thu_tom      
   attr_accessor :Fri_fromh
   attr_accessor :Fri_fromm   
   attr_accessor :Fri_toh
   attr_accessor :Fri_tom      
   attr_accessor :Sat_fromh
   attr_accessor :Sat_fromm   
   attr_accessor :Sat_toh
   attr_accessor :Sat_tom      
   attr_accessor :Sun_fromh  
   attr_accessor :Sun_fromm   
   attr_accessor :Sun_toh  
   attr_accessor :Sun_tom      
   attr_accessor :daysOfWeek_id
   
   validates_with HourValidation
   has_many :student_class_students
   has_many :students, :through =>:student_class_students  
   has_many :student_class_teachers
   has_many :teachers, :through =>:student_class_teachers
   has_many :student_class_dayweeks
   has_many :dayweeks, :through =>:student_class_dayweeks 
   belongs_to :lounge
   belongs_to :subject
   
end
