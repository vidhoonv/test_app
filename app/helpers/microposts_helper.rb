module MicropostsHelper
 def nested_feed(microposts)
   
   microposts.map do |message, sub_messages|
     puts message.content
     puts sub_messages
       render(:partial => 'shared/nested_item' ,  :locals => { :micropost => message } ) + content_tag(:div, nested_feed(sub_messages), :class => "nested_feed")
    end.join.html_safe
   
 end
end