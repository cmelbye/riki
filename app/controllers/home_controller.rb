class HomeController < ApplicationController
  
  def index
    @site_title = "Dashboard"
    @spaces = Space.find(:all)
    @revisions = Revision.find(:all, :limit => 6, :order => "id DESC")
    @home = Home.find(1)
  end
  
  def edit
    @site_title = "Dashboard Administration"
    @home = Home.find(1)
  end
  
end