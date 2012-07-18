# -*- encoding : utf-8 -*-
class Center < ActiveRecord::Base
   validates :name, :address, :presence=>true
   attr_accessible :name, :address, :description
   has_many :lounges, :dependent => :restrict
   #validates_with CenterValidator
end
