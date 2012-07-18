# -*- encoding : utf-8 -*-
class CentersController < ApplicationController
  before_filter :authenticate, :only=>[:index, :edit ,:update, :show, :new, :create, :destroy]
  # GET /centers
  # GET /centers.xml
  def index
    @center = Center.new
    @all_centers = Center.all

  end

  # GET /centers/1
  # GET /centers/1.xml
  def show
    @center = Center.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @center }
    end
  end

  # GET /centers/new
  # GET /centers/new.xml
  def new

  end

  # GET /centers/1/edit
  def edit
    @center = Center.find(params[:id])
    CustomLogger.debug("Center edited")
    CustomLogger.debug("--------------")       
    to_log(@center)       
    @all_centers = Center.all
  end

  # POST /centers
  # POST /centers.xml
  def create
      @center =  Center.new(params[:center])   
      if @center.save
        CustomLogger.debug("Center created")
        CustomLogger.debug("--------------")       
        to_log(@center)
        @center = Center.new
      end
      @all_centers = Center.all      
  end

  # PUT /centers/1
  # PUT /centers/1.xml
  def update
   @center = Center.find(params[:id])
   @center.update_attributes(params[:center])
   if @center.save
       CustomLogger.debug("Center updates")
       CustomLogger.debug("--------------")
       to_log(@center)
       @center = Center.new
   end
   @all_centers = Center.all    
  end

  # DELETE /centers/1
  # DELETE /centers/1.xml
  def destroy
    @center = Center.find(params[:id])
    begin
        CustomLogger.debug("Center destroyed")
        CustomLogger.debug("--------------")       
        to_log(@center)             
        @center.destroy
    rescue
        session[:error] ="You can not remove this center, it has a classroom association."
        hasError=1
    end
    @center = Center.new
    @all_centers = Center.all          
  end
  def clear_center 
       CustomLogger.debug("clearCenter")
       CustomLogger.debug("--------------")    
    redirect_to centers_path        
  end
  def to_log(object_to_log)
    CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Id: "+object_to_log.id.to_s+" Name: "+object_to_log.name+" Address: "+object_to_log.address+" Description: "+object_to_log.description)    
  end
end
