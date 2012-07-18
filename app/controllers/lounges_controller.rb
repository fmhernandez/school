# -*- encoding : utf-8 -*-
class LoungesController < ApplicationController
before_filter :authenticate, :only=>[:index, :edit, :update, :show, :new, :create, :destroy]      
  # GET /lounges
  # GET /lounges.xml
  def index
    @lounges =  Lounge.new  
    @all_lounges = Lounge.all
  end

  # GET /lounges/1
  # GET /lounges/1.xml
  def show

  end

  # GET /lounges/new
  # GET /lounges/new.xml
  def new
    @lounge = Lounge.new
  end

  # GET /lounges/1/edit
  def edit
    @lounges = Lounge.find(params[:id])
    @selected_center = @lounges.center_id
    @all_lounges = Lounge.all
    CustomLogger.debug("Lounge edited")
    CustomLogger.debug("--------------")       
    to_log(@lounges)           
  end

  # POST /lounges
  # POST /lounges.xml
  def create
    @lounges =  Lounge.new(params[:lounge])
    if @lounges.save
      CustomLogger.debug("Lounge created")
      CustomLogger.debug("--------------")       
      to_log(@lounges)                 
      @lounges = Lounge.new
    end
    @all_lounges = Lounge.all    
  end

  # PUT /lounges/1
  # PUT /lounges/1.xml
  def update
    @lounges = Lounge.find(params[:id])
    @lounges.update_attributes(params[:lounge])
    if @lounges.save
      CustomLogger.debug("Lounge updated")
      CustomLogger.debug("--------------")       
      to_log(@lounges)                 
      @lounges = Lounge.new
    end
    @all_lounges = Lounge.all

  end

  # DELETE /lounges/1
  # DELETE /lounges/1.xml
  def destroy
    @lounges = Lounge.find(params[:id])
    CustomLogger.debug("Lounge destroyed")
    CustomLogger.debug("--------------")       
    to_log(@lounges)               
    @lounges.destroy
    @lounges = Lounge.new
    @all_lounges = Lounge.all
  end
  def clear_lounge
    @lounges = Lounge.new
    @all_lounges = Lounge.all
    CustomLogger.debug("clear_lounge")
    CustomLogger.debug("--------------")           
  end
  def to_log(object_to_log)
    CustomLogger.debug(DateTime.current.to_formatted_s(:rfc822)+" Name:"+object_to_log.name+" Description: "+object_to_log.description+" Center: "+object_to_log.center.name)
  end
end
