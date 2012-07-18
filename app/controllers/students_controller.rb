# -*- encoding : utf-8 -*-
class StudentsController < ApplicationController
before_filter :authenticate, :only=>[:index, :edit, :show, :new, :create, :destroy]    
# GET /students
  # GET /students.xml
  def index
    @students =  Student.new  
    @all_students = Student.all
  end

  # GET /students/1
  # GET /students/1.xml
  def show

  end

  # GET /students/new
  # GET /students/new.xml
  def new
  end

  # GET /students/1/edit
  def edit
   @students = Student.find(params[:id])
   CustomLogger.debug("Student edited")
   CustomLogger.debug("--------------")       
   to_log(@students)   
   @all_students = Student.all
  end

  # POST /students
  # POST /students.xml
  def create
    @students =  Student.new(params[:student])
    #Clear student only if there aren't validation errors
          puts "PAAAAAAAA"
      puts @students.errors.size      
    if @students.save
        CustomLogger.debug("Student created")        
        CustomLogger.debug("--------------")       
        to_log(@students)
        @students  = Student.new    
    end
    @all_students = Student.all    
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
   @students = Student.find(params[:id])
   @students.update_attributes(params[:student])
   if @students.save
        CustomLogger.debug("Student updated")
        CustomLogger.debug("--------------")       
        to_log(@students)     
       @students = Student.new
   end
   @all_students = Student.all    
   #redirect_to students_path
  end
  def clearStudent
    CustomLogger.debug("clearStudent")
    CustomLogger.debug("--------------")           
    @students =Student.new
    redirect_to students_path    
  end
  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
   @students = Student.find(params[:id])
    CustomLogger.debug("Student destroyed")
    CustomLogger.debug("--------------")   
    to_log(@students)         
   @students.destroy   
   @students = Student.new
   @all_students = Student.all
   #redirect_to students_path    
  end
  def to_log(object_to_log)
    #CustomLogger.debug(DateTime.to_s)
    CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Id: "+object_to_log.id.to_s+" Name: "+object_to_log.name+" Surname1: "+object_to_log.surname1+" Surname2: "+object_to_log.surname2+" Email: "+object_to_log.email+" phone1: "+object_to_log.phone1+" phone2: "+object_to_log.phone2)          
  end
end
