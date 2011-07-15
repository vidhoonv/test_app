module ApplicationHelper

# Return a title on a per page basis
  def title 
	base_title="140"
	if @title.nil?
		base_title
	else
		"#{base_title} | #{@title}"
	end
  end
 def logo
   
    image_tag("app_title.png", :alt => "140", :class => "round", :size => "100x60")
  end

 

end
