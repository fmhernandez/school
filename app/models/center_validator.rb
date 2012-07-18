# -*- encoding : utf-8 -*-
# To change this template, choose Tools | Templates
# and open the template in the editor.

class CenterValidator < ActiveModel::Validator
  def validate (record)
    if record["name"] == ""
          record.errors.add(:name)
    end
  end
end
