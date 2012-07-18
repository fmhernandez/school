# -*- encoding : utf-8 -*-
module StudentsHelper
  def table_students
  
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  @all_students.each {|student|
    column_values = Array.new
    column_values << student.name
    column_values << student.surname1
    column_values << student.surname2
    column_values << student.email
    column_values << student.phone1
    column_values << student.phone2
    column_values << String(student.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Surname1"
  header << "Surname2"
  header << "Email"
  header << "Phone1"  
  header << "Phone2"  
  header << "Action"
  making_table(collection_rows, header, 6, "students")
end
end
