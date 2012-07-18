# -*- encoding : utf-8 -*-
module UsersHelper
  def table_users
  collection_rows = Array.new
  collection_headers = Array.new    
  header = Array.new
  @all_users.each {|user|
    column_values = Array.new
    column_values << user.name
    column_values << user.description
    column_values << String(user.id)
    collection_rows << column_values
  }
  header << "Name"
  header << "Description"
  header << "Action"
  making_table(collection_rows, header, 2, "users")
  end
end
