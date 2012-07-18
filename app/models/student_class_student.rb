class StudentClassStudent < ActiveRecord::Base
  belongs_to :student
  belongs_to :student_class
end
