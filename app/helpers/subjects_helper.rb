module SubjectsHelper
  def teacher_list_selection_subject (teacher_id)
    ret = false
    @subject.teachers.each {|teacher|      
      if teacher_id == teacher.id
        ret = true
        break
      end
    }
    return ret
  end  
  def table_subjects
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  

  @all_subjects.each {|subject|
    column_values = Array.new
    column_values << subject.name
    column_values << subject.description
    column_values << String(subject.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Description"
  header << "Action"
  making_table(collection_rows, header, 2, "subjects")    
  end
end
