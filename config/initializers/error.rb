# -*- encoding : utf-8 -*-
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if instance.error_message.kind_of?(Array)
    #%(#{html_tag}<span class="validation-error">&nbsp;
    #  #{instance.error_message.join(',')}</span>).html_safe
    #html_tag = '<input id="student_name" name="student[name]" size="30" type="text" value="" />'
    #html_tag['class="fir"']=''    
    #puts html_tag
    %(#{html_tag}).html_safe
  else
    %(#{html_tag}.html_safe)
   # %(#{html_tag}<span class="validation-error">&nbsp;
   #   #{instance.error_message}</span>).html_safe
  end
end
