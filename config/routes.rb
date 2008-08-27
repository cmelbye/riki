ActionController::Routing::Routes.draw do |map|
  map.resources :tasks

  map.resources :accounts
  
  map.resources :spaces do |spaces|
    spaces.resources :pages
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.display_space 'display/:space_id', :controller => 'pages', :action => 'show'
  
  map.space_page_revisions 'spaces/:space_id/pages/:id/revisions', :controller => "pages", :action => "revisions"
  map.space_page_revision 'spaces/:space_id/pages/:id/revision/:revision_id', :controller => "pages", :action => "revision"
  
  # admin routes
  # format: admin_actionname
  # map.dash_prefs 'admin/dashboard', :controller => 'home', :action => 'edit'
  map.admin_dashboard 'admin/dashboard', :controller => "admin", :action => "dashboard"
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => "home", :action => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
