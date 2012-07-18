# -*- encoding : utf-8 -*-
# To change this template, choose Tools | Templates
# and open the template in the editor.

class HourValidation < ActiveModel::Validator
  def validate(record)
    if record.Mon_check == "1"
      validate_day_week_hour record.Mon_fromh, "Mon_fromh", "start hour monday", record
      validate_day_week_minute record.Mon_fromm, "Mon_fromm", "start minute monday", record      
      validate_day_week_hour record.Mon_toh, "Mon_toh", "end hour monday", record      
      validate_day_week_minute record.Mon_tom, "Mon_tom","end minute monday",  record   
      isStartTimeHiger?(record.Mon_fromh, record.Mon_fromm, record.Mon_toh, record.Mon_tom, "Mon", record)

    end
    if record.Tue_check == "1"
      validate_day_week_hour record.Tue_fromh, "Tue_fromh", "start hour tuesday", record
      validate_day_week_minute record.Tue_fromm, "Tue_fromm", "start minute tuesday", record      
      validate_day_week_hour record.Tue_toh, "Tue_toh", "end hour tuesday", record      
      validate_day_week_minute record.Tue_tom, "Tue_tom", "start minute tuesday", record            
    end
    if record.Wed_check == "1"
      validate_day_week_hour record.Wed_fromh, "Wed_fromh", "start hour wednesday", record
      validate_day_week_minute record.Wed_fromm, "Wed_fromm", "start minute wednesday", record      
      validate_day_week_hour record.Wed_toh, "Wed_toh", "end hour wednesday", record      
      validate_day_week_minute record.Wed_tom, "Wed_tom", "end minute wednesday", record            
    end
    if record.Thu_check == "1"
      validate_day_week_hour record.Thu_fromh, "Thu_fromh", "start hour thursday", record
      validate_day_week_minute record.Thu_fromm, "Thu_fromm", "start minute thursday", record      
      validate_day_week_hour record.Thu_toh, "Thu_toh", "end hour thursday", record      
      validate_day_week_minute record.Thu_tom, "Thu_tom", "end minute thursday", record                  
    end    
    if record.Fri_check == "1"
      validate_day_week_hour record.Fri_fromh, "Fri_fromh", "start hour friday", record
      validate_day_week_minute record.Fri_fromm, "Fri_fromm", "start minute friday", record
      validate_day_week_hour record.Fri_toh, "Fri_toh", "end hour friday", record
      validate_day_week_minute record.Fri_tom, "Fri_tom", "end minute friday", record
    end    
    if record.Sat_check == "1"
      validate_day_week_hour record.Sat_fromh, "Sat_fromh", "start hour saturday", record
      validate_day_week_minute record.Sat_fromm, "Sat_fromm", "start minute saturday", record
      validate_day_week_hour record.Sat_toh, "Sat_toh", "end hour saturday", record
      validate_day_week_minute record.Sat_tom, "Sat_tom", "end minute saturday", record
    end        
    if record.Sun_check == "1"
      validate_day_week_hour record.Sun_fromh, "Sun_fromh", "start hour sunday", record
      validate_day_week_minute record.Sun_fromm, "Sun_fromm", "start minute sunday", record
      validate_day_week_hour record.Sun_toh, "Sun_toh", "end hour sunday", record
      validate_day_week_minute record.Sun_tom, "Sun_tom", "end minute sunday", record
    end        
  end
  def isnil? (value)
    if value == "" or value == nil
      return true
    else
      return false
    end
  end
  def isnumeric? (value)
    
  end
  def validate_day_week_hour (day, selector, day_name, record)
      #^ is used to avoid the field's name in the text error (you have to use dynamicform gem)
      record.errors[selector] << "^Null value is not allowed in "+day_name if isnil? day
      #I had to clone this variable to avoid the original one modification.
      local_day = day.clone

      record.errors[selector] << "^The value for "+day_name+ " must be in a 0-23 range" if (!((0..23) === day.to_i) or !isNumber? day) and !isnil? day
  end
  def validate_day_week_minute (day, selector, day_name, record)
      record.errors[selector] << "^Null value is not allowed in "+day_name if isnil? day
      record.errors[selector] << "^Minute must be in a 0-59 range in "+day_name if (!((0..59) === day.to_i) or !isNumber? day) and !isnil? day
  end  
  def isNumber? (value)
    #Removing the first "0" from the string (if exists). It represents an octal value in ruby and
    #we are working with decimal values.
    #if (value[0] == "0")
    if (value.length < 2)
      #value = value.slice!(0)
      value = "0"+value
    end
    #number_to_return = Integer("%02d"%value) rescue nil
    #if !isnil? number_to_return
    #  return true
    #else
    #  return false
    #end
    if /^[\d]{2}/ === value
      return true
    else
      return false
    end
  end
  def isStartTimeHiger?(startHour, startMinute, endHour, endMinute, selector, record)
    iStartHour = Integer(startHour) rescue nil
    iStartMinute = Integer(startMinute) rescue nil    
    iEndHour = Integer(endHour) rescue nil
    iEndMinute = Integer(endMinute) rescue nil    
    if iStartHour != nil and iStartMinute != nil and iEndHour != nil and iEndMinute != nil
        if iStartHour > iEndHour
            record.errors[selector+"_fromh"] = "^Start time must be greater than end time"
            record.errors[selector+"_toh"] = "^End time must be less than end time"
        end
    end
  end
end
