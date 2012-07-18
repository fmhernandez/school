class Subject < ActiveRecord::Base
       validates :name, :presence=>true
   has_many :subject_teachers
   has_many :teachers, :through => :subject_teachers       
end
