# -*- encoding : utf-8 -*-
#encoding: UTF-8
module CentersHelper
  def table_centers
  
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  @all_centers.each {|center|
    column_values = Array.new
    column_values << center.name
    column_values << center.address
    column_values << center.description
    column_values << String(center.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Address"
  header << "Description"
  header << "Action"
  making_table(collection_rows, header, 3, "centers")
end
end
