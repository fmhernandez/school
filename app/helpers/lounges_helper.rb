# -*- encoding : utf-8 -*-
module LoungesHelper
  def table_lounges
  
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  

  @all_lounges.each {|lounge|
    column_values = Array.new
    column_values << lounge.name
    column_values << lounge.description
    column_values << lounge.center.name
    column_values << String(lounge.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Description"
  header << "Center"
  header << "Action"
  making_table(collection_rows, header, 3, "lounges")
end  
end
