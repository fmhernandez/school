# -*- encoding : utf-8 -*-
class TeachersController < ApplicationController
before_filter :authenticate, :only=>[:index, :edit, :update, :show, :new, :create, :destroy]      
  # GET /teachers
  # GET /teachers.xml
  def index
    @teachers = Teacher.new
    restore_lists    
  end

  # GET /teachers/1
  # GET /teachers/1.xml
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.xml
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teachers = Teacher.find(params[:id])
    restore_lists
    CustomLogger.debug("Teacher edited")
    CustomLogger.debug("--------------")       
    to_log(@teachers)
  end

  # POST /teachers
  # POST /teachers.xml
  def create
    @teachers = Teacher.new(params[:teacher])
    if params[:subjects_id] == nil
        session[:error] ="You have to choose one or more subjects."
        hasError = 1
    else
        if @teachers.save
            adding_subjects(@teachers)          
            CustomLogger.debug("Teacher created")
            CustomLogger.debug("--------------")       
            to_log(@teachers)                   
            @teachers  = Teacher.new    
        else
    end
  end
          restore_lists
  end

  # PUT /teachers/1
  # PUT /teachers/1.xml
  def update
   hasError = 0
   @teachers = Teacher.find(params[:id])   
    if params[:subjects_id] == nil
        #session[:error] ="You have to choose one or more subjects."
        render :js => "alert('You have to choose one or more subjects.');"        
        #hasError = 1
    else      
        if @teachers.update_attributes(params[:teacher]) 
            @teachers.subjects.delete_all
            adding_subjects(@teachers)             
            CustomLogger.debug("Teacher updated")
            CustomLogger.debug("--------------")       
            to_log(@teachers)            
            @teachers = Teacher.new
        end
    end
    restore_lists
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.xml
  def destroy
    @teachers = Teacher.find(params[:id])
    CustomLogger.debug("Teacher destroyed")
    CustomLogger.debug("--------------")       
    to_log(@teachers)           
    @teachers.destroy
    @teachers = Teacher.new
    restore_lists

  end
  def afterSubmit
    @teachers = Teacher.new    
    restore_lists
  end
   def clearTeacher
    @teachers =Teacher.new
    restore_lists
    CustomLogger.debug("clearTeacher")
    CustomLogger.debug("--------------")           
  end
  def restore_lists
    @all_teachers = Teacher.all
    @all_subjects = Subject.all
  end
  def adding_subjects (teacher)
    #clear all subjects before add the new ones.
    #We ensure that only the selected ones will be in the list.
    teacher.subjects.clear
    params[:subjects_id].each{|t|
      subject_aux =Subject.find(t)
      teacher.subjects << subject_aux
    }
  end
  def to_log(object_to_log)
    CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Dni: "+object_to_log.dni+" Name: "+object_to_log.name+" Surname1: "+object_to_log.surname1+" Surname2: "+object_to_log.surname2+" Phone1: "+object_to_log.phone1+" Phone2: "+object_to_log.phone2+" Address: "+object_to_log.address)
    object_to_log.subjects.each {|subject|
      CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Subject Id:"+subject.id.to_s+" Subject name:"+subject.name)
    }    
  end
end
