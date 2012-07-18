# -*- encoding : utf-8 -*-
class StudentClassesController < ApplicationController
before_filter :authenticate, :only=>[:index, :edit, :show, :new, :create, :destroy]          
  # GET /student_classes
  # GET /student_classes.xml
  #@default = "nonil"
  @hasError = 0
  def index
    @hasError = 0
    @student_class = StudentClass.new
    restore_lists
    getLounges
    createDayOfWeek
    0.upto @dayOfWeek.count-1 do|i|
    end
    
  end

  # GET /student_classes/1
  # GET /student_classes/1.xml
  def show
    @student_class = StudentClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_class }
    end
  end

  # GET /student_classes/new
  # GET /student_classes/new.xml
  def new
    @student_class = StudentClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_class }
    end
  end

  # GET /student_classes/1/edit
  def edit
    @student_class = StudentClass.find(params[:id])
    @student_class.student_class_dayweeks.each {|class_day|
        filling_dates(@student_class, class_day)
    }
    #@selected_center: variable used for lounge list selection
    @selected_center = @student_class.lounge_id
    @selected_subject = @student_class.subject_id
    restore_lists
    createDayOfWeek
  end

  # POST /student_classes
  # POST /student_classes.xml
  def create
    hasError = 0
    createDayOfWeek
    @centers = Center.all
    @student_class = StudentClass.new(params[:student_class])
    @all_students = Student.all
    @all_teachers = Teacher.all
    @default ="S"
    if @student_class.Mon_check == "0" and @student_class.Tue_check == "0" and
       @student_class.Wed_check == "0" and @student_class.Thu_check == "0" and
       @student_class.Fri_check == "0" and @student_class.Sat_check == "0" and
       @student_class.Sun_check == "0"
      session[:error] ="You have to choose one day of week at least."
      hasError = 1
    end
    #######################################################
    #########Adding hours and minutes from date fields#####
    #######################################################
    adding_hours
    getLounges
    #######################################################
    ###########Adding students from checked ones###########
    #######################################################    
    adding_students
    #######################################################
    ###########Adding teachers from checked ones###########
    #######################################################   
    hasError == 0
    adding_teachers
    if hasError == 0
        if @student_class.save and 
            @student_class = StudentClass.new
        end
    end
    @all_student_classes = StudentClass.all  
  end

  # PUT /student_classes/1
  # PUT /student_classes/1.xml
  def update
    #we're getting the current form field's values
    @student_class = StudentClass.new(params[:student_class])    
    hasError = 0
    if @student_class.Mon_check == "0" and @student_class.Tue_check == "0" and
       @student_class.Wed_check == "0" and @student_class.Thu_check == "0" and
       @student_class.Fri_check == "0" and @student_class.Sat_check == "0" and
       @student_class.Sun_check == "0"
      session[:error] ="You have to choose one day of week at least."
      hasError = 1
    end
    if hasError == 0
        @student_class = StudentClass.find(params[:id])      
        

        #if @student_class.save
        if @student_class.update_attributes(params[:student_class])
          @student_class.student_class_dayweeks.delete_all
          adding_hours      
          @student_class.student_class_students.delete_all    
          adding_students      
          @student_class.student_class_teachers.delete_all
          adding_teachers      
          @student_class = StudentClass.new
        end
     end
     restore_lists
     createDayOfWeek
  end

  # DELETE /student_classes/1
  # DELETE /student_classes/1.xml
  def destroy
    @student_class = StudentClass.find(params[:id])
    @student_class.destroy
    restore_lists
    createDayOfWeek
    @student_class = StudentClass.new

  #  respond_to do |format|
  #    format.html { redirect_to(student_classes_url) }
  #    format.xml  { head :ok }
  #  end
  end
  def getLounges
    @lounges_by_center = Lounge.all    
  end
  def createDayOfWeek
    @dayOfWeek = Dayweek.all
  end
  def add_minutes_hour fromh, fromm, toh, tom, dayweek
      student_class_dayweek = StudentClassDayweek.new
      student_class_dayweek.from_time = fromh
      student_class_dayweek.from_time = student_class_dayweek.from_time + fromm      
      student_class_dayweek.to_time = toh
      student_class_dayweek.to_time = student_class_dayweek.to_time + tom   
      student_class_dayweek.dayweek = dayweek
      return student_class_dayweek
  end 
  #########################################################################################
  ###########remove left/right spaces and pad left side with 0 if it's necesary############
  #########################################################################################
  def format_hour_minute(hour_minute)
    hour_minute.lstrip.rstrip.rjust(2,'0')    
  end
  #########################################################################################
  ################################restore all page's lists#################################
  #########################################################################################  
  def restore_lists
    @all_student_classes = StudentClass.all 
    @all_students = Student.all
    @all_teachers = Teacher.all    
  end
  #########################################################################################
  ###########################fill time and day of the week#################################
  #########################################################################################    
  def filling_dates (student_class, class_day)
        prefix = Dayweek.find_by_id(class_day.dayweek_id).dayname
        if prefix == "Monday"
            student_class.Mon_fromh = class_day.from_time[0,2]
            student_class.Mon_fromm = class_day.from_time[2,2]
            student_class.Mon_toh = class_day.to_time[0,2]
            student_class.Mon_tom = class_day.to_time[2,2]                      
            student_class.Mon_check = "1"
        end
        if prefix == "Tuesday"
            student_class.Tue_fromh = class_day.from_time[0,2]
            student_class.Tue_fromm = class_day.from_time[2,2]
            student_class.Tue_toh = class_day.to_time[0,2]
            student_class.Tue_tom = class_day.to_time[2,2]
            student_class.Tue_check = "1"
        end
        
        if prefix == "Wednesday"
            student_class.Wed_check = "1"
            student_class.Wed_fromh = class_day.from_time[0,2]
            student_class.Wed_fromm = class_day.from_time[2,2]
            student_class.Wed_toh = class_day.to_time[0,2]
            student_class.Wed_tom = class_day.to_time[2,2]
            student_class.Wed_check = "1"            
        end
        if prefix == "Thursday"
            student_class.Thu_fromh = class_day.from_time[0,2]
            student_class.Thu_fromm = class_day.from_time[2,2]
            student_class.Thu_toh = class_day.to_time[0,2]
            student_class.Thu_tom = class_day.to_time[2,2]
            student_class.Thu_check = "1"
        end
        if prefix == "Friday"
            student_class.Fri_fromh = class_day.from_time[0,2]
            student_class.Fri_fromm = class_day.from_time[2,2]
            student_class.Fri_toh = class_day.to_time[0,2]
            student_class.Fri_tom = class_day.to_time[2,2]            
            student_class.Fri_check = "1"            
        end
        if prefix == "Saturday"
            student_class.Sat_fromh = class_day.from_time[0,2]
            student_class.Sat_fromm = class_day.from_time[2,2]
            student_class.Sat_toh = class_day.to_time[0,2]
            student_class.Sat_tom = class_day.to_time[2,2]            
            student_class.Sat_check = "1"             
        end
        if prefix == "Sunday"    
            student_class.Sun_fromh = class_day.from_time[0,2]
            student_class.Sun_fromm = class_day.from_time[2,2]
            student_class.Sun_toh = class_day.to_time[0,2]
            student_class.Sun_tom = class_day.to_time[2,2]
            student_class.Sun_check = "1"
        end
  end
  def clear_student_class
    redirect_to student_classes_path
  end
  #######################################################
  #########Adding hours and minutes from date fields#####
  #######################################################  
  def adding_hours
    if @student_class.Mon_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Mon_fromh), format_hour_minute(@student_class.Mon_fromm), format_hour_minute(@student_class.Mon_toh), format_hour_minute(@student_class.Mon_tom), Dayweek.find_by_abbreviation("Mon")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end
    if @student_class.Tue_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Tue_fromh), format_hour_minute(@student_class.Tue_fromm), format_hour_minute(@student_class.Tue_toh), format_hour_minute(@student_class.Tue_tom), Dayweek.find_by_abbreviation("Tue")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end
    if @student_class.Wed_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Wed_fromh), format_hour_minute(@student_class.Wed_fromm), format_hour_minute(@student_class.Wed_toh), format_hour_minute(@student_class.Wed_tom), Dayweek.find_by_abbreviation("Wed")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end  
    if @student_class.Thu_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Thu_fromh), format_hour_minute(@student_class.Thu_fromm), format_hour_minute(@student_class.Thu_toh), format_hour_minute(@student_class.Thu_tom), Dayweek.find_by_abbreviation("Thu")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end 
    if @student_class.Fri_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Fri_fromh), format_hour_minute(@student_class.Fri_fromm), format_hour_minute(@student_class.Fri_toh), format_hour_minute(@student_class.Fri_tom), Dayweek.find_by_abbreviation("Fri")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end    
    if @student_class.Sat_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Sat_fromh), format_hour_minute(@student_class.Sat_fromm), format_hour_minute(@student_class.Sat_toh), format_hour_minute(@student_class.Sat_tom), Dayweek.find_by_abbreviation("Sat")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end
    if @student_class.Sun_check == "1"
      @student_class_dayweek = add_minutes_hour format_hour_minute(@student_class.Sun_fromh), format_hour_minute(@student_class.Sun_fromm), format_hour_minute(@student_class.Sun_toh), format_hour_minute(@student_class.Sun_tom), Dayweek.find_by_abbreviation("Sun")
      @student_class.student_class_dayweeks << @student_class_dayweek
    end        
  end
 #######################################################
 ###########Adding students from checked ones###########
 #######################################################      
  def adding_students
    if params[:students_id] == nil
        session[:error] ="You have to select one or more students."
        hasError = 1
    else
        params[:students_id].each{|t|
          student_aux =Student.find(t)
          @student_class.students << student_aux
        }
    end    
  end
  def adding_teachers
    if params[:teachers_id] == nil
        session[:error] ="You have to select one or more teachers."
        hasError = 1
    else
        params[:teachers_id].each{|t|
          teacher_aux =Teacher.find(t)
          @student_class.teachers << teacher_aux
        }
    end 
  end
end
