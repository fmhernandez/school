# -*- encoding : utf-8 -*-
class ClassStudentsController < ApplicationController
  # GET /student_classes
  # GET /student_classes.xml
  def index
    @student_class = StudentClass.new
    @all_students = Student.all
    @all_teachers = Teacher.all
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
    @student_class = StudentClass.new
    @all_students = Student.all
    @all_teachers = Teacher.all
  end

  # POST /student_classes
  # POST /student_classes.xml
  def create
    @student_class = StudentClass.new(params[:student_class])
    @student_class = StudentClass.new
    @all_students = Student.all
    @all_teachers = Teacher.all
        puts params[:student_ids]
    puts "ZZZZZZZZZZZ"
  
  end

  # PUT /student_classes/1
  # PUT /student_classes/1.xml
  def update
    puts "Pasa"
  end

  # DELETE /student_classes/1
  # DELETE /student_classes/1.xml
  def destroy
    @student_class = StudentClass.find(params[:id])
    @student_class.destroy

    respond_to do |format|
      format.html { redirect_to(student_classes_url) }
      format.xml  { head :ok }
    end
  end
end
