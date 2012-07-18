# -*- encoding : utf-8 -*-
class StudentClassDayweek < ActiveRecord::Base
  belongs_to :dayweek
  belongs_to :student_class
end
