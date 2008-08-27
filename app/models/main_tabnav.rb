class MainTabnav < Tabnav::Base    
       
    add_tab do 
      named 'Dashboard'
      links_to :controller => 'home'
    end
    
    add_tab do 
      named 'Spaces'
      links_to :controller => 'spaces'
    end 
    
    add_tab do
      named 'All People'
      links_to :controller => "account", :action => "list"
    end
    
    add_tab do
      named 'Preferences'
      links_to :controller => 'account', :action => "edit"
      show_if "logged_in?"
    end
    
    add_tab do
      named 'Admin'
      links_to :controller => "admin"
      show_if "logged_in?"
    end
    
    add_tab do
      named 'Login'
      links_to :controller => "account", :action => "login"
      show_if "!logged_in?"
    end
         
end