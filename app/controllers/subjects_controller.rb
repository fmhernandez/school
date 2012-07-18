class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.xml
  def index
    hasError = 0
    @subject= Subject.new
    restore_lists
  end

  # GET /subjects/1
  # GET /subjects/1.xml
  def show
 
  end

  # GET /subjects/new
  # GET /subjects/new.xml
  def new
    @subject = Subject.new

  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
    @selected_teacher = @subject.teacher_id
    restore_lists
    filling_teachers @subject
    CustomLogger.debug("Subject edited")
    CustomLogger.debug("--------------")       
    to_log(@subject)       
  end

  # POST /subjects
  # POST /subjects.xml
  def create
    hasError = 0
    @subject = Subject.new(params[:subject])
    if params[:teachers_id] == nil
        session[:error] ="You have to select one or more teachers."
        hasError = 1
    else
      if @subject.save
          params[:teachers_id].each{|t|
              teacher_aux =Teacher.find(t)
              @subject.teachers << teacher_aux
          }
          CustomLogger.debug("Subject created")
          CustomLogger.debug("--------------")       
          to_log(@subject)                     
          @subject= Subject.new
      end
    end
    restore_lists
  end

  # PUT /subjects/1
  # PUT /subjects/1.xml
  def update
    hasError = 0   
    @subject = Subject.find(params[:id])    
    if params[:teachers_id] == nil
      session[:error] ="You have to select one or more teachers."      
      hasError = 1
    else
        if @subject.update_attributes(params[:subject]) 
            @subject.teachers.delete_all
            adding_teachers    
            CustomLogger.debug("Subject updated")
            CustomLogger.debug("--------------")       
            to_log(@subject)                                 
            @subject = Subject.new
        end      
    end   
    restore_lists
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.xml
  def destroy
    @subject = Subject.find(params[:id])
    CustomLogger.debug("Subject destroyed")
    CustomLogger.debug("--------------")       
    to_log(@subject)           
    @subject.destroy
    @subject = Subject.new
    restore_lists
    end
  #end
  def clear_subject
    @subject = Subject.new
    @all_subjects = Subject.all
    CustomLogger.debug("clear_subject")
    CustomLogger.debug("--------------")      
    restore_lists    
  end  
  def filling_teachers (subject)
    teachers = subject.teachers
    teachers.each { |i|
          puts i.id}
  end
  def adding_teachers
    params[:teachers_id].each{|t|
      teacher_aux =Teacher.find(t)
      @subject.teachers << teacher_aux
    }
  end  
  def restore_lists
    @all_subjects = Subject.all    
    @all_teachers = Teacher.all    
  end
  def to_log (object_to_log)
    CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Name: "+object_to_log.name+" Description: "+object_to_log.description)
    object_to_log.teachers.each {|teacher|
      CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Teacher Id:"+teacher.id.to_s+" Teacher name:"+teacher.name)
    }
  end
end
