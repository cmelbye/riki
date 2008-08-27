module ApplicationHelper  
  # renders the tabnav
  def tabnav tabnav_sym
    result = capture do
      render  :partial => "tabnav/#{tabnav_sym.id2name}_tabnav", 
                      :locals => { :tabs => tabnav_sym.to_tabnav.tabs }
    end
    result  
  end
  
  # adds the content div
  def start_tabnav tabnav_sym
    result = tabnav(tabnav_sym) 
    result << "\n"
    result << "<div id='#{tabnav_sym.id2name}_content'>"
    result 
  end
  
  def end_tabnav
    "</div>"
  end
  
end
