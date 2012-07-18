# -*- encoding : utf-8 -*-
module SessionsHelper
  def sign_in(user)
    session[:remember_token] = user

  end
 #def current_user
 #   return @current_user
 # end  
  def signed_in?
    !session[:remember_token].nil?
  end  
  def current_user=(user)
    @current_user=user
  end

  def deny_access
    #redirect_to '/sessions/new', :notice => "Please sign in to access this page."
    #@error_message ="Oooops, you have to log in before..."    
    session[:error] ="Oooops,cheats are not allowed, you have not logged in..."
    redirect_to '/sessions/new'
  end  
  
 def authenticate
      deny_access unless signed_in?
  end 
  def get_error_session
    return get_error
  end
end
