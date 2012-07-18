# -*- encoding : utf-8 -*-
class Dayweek < ActiveRecord::Base
  has_many :student_class_dayweeks
  has_many :student_classes, :through => :student_class_dayweeks
end
