# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  before_filter :authenticate, :only=>[:mainMenu]  
  def home
    @user = User.new
  end
  def mainMenu
    
  end

end
