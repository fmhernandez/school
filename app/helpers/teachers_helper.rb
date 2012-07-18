# -*- encoding : utf-8 -*-
module TeachersHelper
  def table_teachers
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  @all_teachers.each {|teacher|
    column_values = Array.new
    column_values << teacher.dni
    column_values << teacher.name
    column_values << teacher.surname1
    column_values << teacher.surname2
    column_values << teacher.phone1
    column_values << teacher.phone2
    column_values << teacher.address
    column_values << String(teacher.id)
    collection_rows << column_values
  }
  header << "Dni"
  header << "Name"
  header << "Surname1"
  header << "Surname2"
  header << "Phone1"
  header << "Phone2"
  header << "Address"
  header << "Action"
  making_table(collection_rows, header, 7, "teachers")
end
def subject_list_selection_teacher (subject_id)
    ret = false
    @teachers.subjects.each {|subject|
      if subject_id == subject.id
        ret = true
        break
      end
    }
    return ret
end
def loading_function()
  puts "LOADING FUNCTION HELPER"
end
end
