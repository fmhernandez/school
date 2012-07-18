# -*- encoding : utf-8 -*-
class Lounge < ActiveRecord::Base
     validates :name, :presence=>true
     attr_accessible :name, :description, :center_id
     belongs_to :center
     has_many :student_class
end
