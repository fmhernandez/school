# -*- encoding : utf-8 -*-
module ApplicationHelper
  def index_ajax
    @teachers =Teacher.new
    redirect_to teachers_path
  end
  def making_table (collection_rows, header, visible_columns, model_name)
  result_table="<table class='altrowstable'>"
  column_acum =""
  cont_row=1
  cont_column=1
  name_for_confirmation=""
  result_table = result_table + "<tr>"
  header.each {|header_name|
    if cont_column <= visible_columns
        result_table = result_table+"<td class='headercolor'>"+header_name+"</td>"
    else
        result_table = result_table+"<td class='headercolor' colspan='2' align='center'>"+header_name+"</td>"      
    end
    cont_column = cont_column + 1
  }
  cont_column = 1
  result_table = result_table + "</tr>"
  collection_rows.each{|columns|
    if cont_row%2 == 0
        result_table = result_table+'<tr class=oddrowcolor>'
    else
        result_table = result_table+'<tr class=evenrowcolor>'
    end    
    cont_column=1
    columns.each{|column_value|
        if column_value == nil
          column_value = ""
        end
        if cont_column <= visible_columns
            if cont_column == 1
              name_for_confirmation = column_value
            end
            column_acum = '<td>'+column_value+'</td>'
            result_table = result_table+column_acum
            column_acum=""
        else
            result_table = result_table + "<td><a data-remote='true' href='/"+model_name+"/"+column_value+"/edit'>Edit</a></td>"            
            result_table = result_table + "<td><a data-remote='true' href='/"+model_name+"/"+column_value+"' data-method='delete' data-confirm='Are you sure you want to delete "+name_for_confirmation+"?'>Delete</a></td>"            
        end
        cont_column = cont_column+1
    }
    cont_row =cont_row + 1    
    result_table = result_table +'</tr>'
    result_table = result_table+""
  }
  result_table = result_table + '</table>'
  return result_table.html_safe
end
def getting_utf8(value)
  #value.force_encoding("ISO-8859-1").encode("UTF-8")
  value.force_encoding("UTF-8")
  return value
end
end
