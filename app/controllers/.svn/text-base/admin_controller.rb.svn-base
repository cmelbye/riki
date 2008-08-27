class AdminController < ApplicationController
  before_filter :setup_console
  
  def index
    
  end
  
  def dashboard
    @home = Home.find(1)
    return unless request.post?
    if @home.update_attributes(params[:home])
      flash[:notice] = 'The dashboard has successfully been updated.'
      redirect_to :controller => "admin"
    else
      flash[:error] = "The dashboard could not be updated. Please correct the errors below:"
      redirect_to :action => "dashboard"
    end
  end
  
  def siteinfo
    @home = Home.find(1)
    return unless request.post?
    if @home.update_attributes(params[:home])
      flash[:notice] = 'Site Information successfully updated.'
      redirect_to :controller => "admin"
    else
      flash[:error] = 'Site Information could not be updated. Please correct the errors below:'
      redirect_to :action => "siteinfo"
    end
  end
  
  private
  def setup_console
    # DRY
    @site_title = "Administration Console"
  end
end