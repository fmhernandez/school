# -*- encoding : utf-8 -*-
# To change this template, choose Tools | Templates
# and open the template in the editor.
class Mon_fromhValidator < ActiveModel::EachValidator
 def validate_each(record, attribute, value)
    puts "PASA VALIDATOR"
  end
end
#class Timehours
# include ActiveModel::Validations
# attr_accesor :Mon_fromh
# validates :Mon_fromh, :Mon_fromh => true
#end
