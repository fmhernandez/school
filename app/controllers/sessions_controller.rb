# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
 #before_filter :create_default_variables 
  
  def new
    #@user = User.new
  end
  def create
    #@user = User.new
    user = User.authenticate(params[:session][:name], params[:session][:password])    
    if user.nil?
      #@error_message ="Invalid email/password combination."
      session[:error] ="Invalid email/password combination."
      @title = "Sign in"
      render 'new'   
    else
      sign_in user
      redirect_to '/mainMenu'
    end
    #@user = User.authenticate("Admin", "admin")    
    #render 'new'
  end
  def destroy
     session[:remember_token] = nil
  end
end
