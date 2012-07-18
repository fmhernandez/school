# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
before_filter :authenticate, :only=>[:index, :edit, :show, :new, :create, :destroy]  

  
  
  
  # GET /students
  # GET /students.xml
  def index
    @users =  User.new  
    @all_users = User.all
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @users =  User.new  
    @all_users = User.all
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @users = User.new
    @all_users = User.all
  end

  # GET /students/1/edit
  def edit
   @users = User.find(params[:id])
   CustomLogger.debug("User edited")
   CustomLogger.debug("--------------")       
   to_log(@users)
   @all_users = User.all
  end

  # POST /students
  # POST /students.xml
  def create
    @users =  User.new(params[:user])
    if @users.save
        CustomLogger.debug("User created")
        CustomLogger.debug("--------------")       
        to_log(@users)      
        @users = User.new
    end
    @all_users = User.all
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
   @users = User.find(params[:id])
   @users.update_attributes(params[:user])
   if @users.save
       CustomLogger.debug("User updated")
       CustomLogger.debug("--------------")       
       to_log(@users)   
       @users = User.new
   else
     puts @users.errors.size
   end
   @all_users = User.all   
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
   @users = User.find(params[:id])
   CustomLogger.debug("User destroyed")
   CustomLogger.debug("--------------")       
   to_log(@users)   
   @users.destroy
   @users = User.new
   @all_users = User.all   
  end  
  def clearUser
   CustomLogger.debug("clearUser")
   CustomLogger.debug("--------------")       
    @users =User.new
    redirect_to users_path
  end
    def to_log(object_to_log)
    CustomLogger.debug(DateTime.current.to_formatted_s+"Id: "+object_to_log.id.to_s+" Name: "+object_to_log.name+" Description: "+object_to_log.description)
  end
end
