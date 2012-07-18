# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  validates :name, :password, :presence=> true
  def has_password?(user, submitted_password)
    user.password == submitted_password
  end
  def self.authenticate(user_name, submitted_password)
    user = find_by_name(user_name)
    return nil if user.nil?
    return user if user.has_password?(user, submitted_password)
  end
end
