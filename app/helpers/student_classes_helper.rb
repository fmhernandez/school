# -*- encoding : utf-8 -*-
module StudentClassesHelper
    cont_row = 1
    def student_list_selection (student_id)
    ret = false
    @student_class.student_class_students.each {|student|      
      if student_id == student.student_id
        ret = true
        break
      end
    }
    return ret
  end
  def teacher_list_selection_student_class (teacher_id)
    ret = false
    @student_class.student_class_teachers.each {|teacher|      
      if teacher_id == teacher.teacher_id
        ret = true
        break
      end
    }
    return ret
  end  
end
def table_teachers
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  @all_student_classes.each {|student_class|
    column_values = Array.new
    column_values << student_class.name
    column_values << student_class.description
    column_values << student_class.lounge.name
    column_values << student_class.lounge.center.name
    column_values << String(student_class.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Surname1"
  header << "Surname2"
  header << "Action"
  making_table(collection_rows, header, 4, "teachers")  
end
def table_classes
  
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  @all_student_classes.each {|student_class|
    column_values = Array.new
    column_values << student_class.subject.name
    column_values << student_class.description
    column_values << student_class.lounge.name
    column_values << student_class.lounge.center.name
    column_values << String(student_class.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Description"
  header << "Lounge"
  header << "Center"
  header << "Action"
  making_table(collection_rows, header, 4, "student_classes")
end

