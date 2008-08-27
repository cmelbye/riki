class AccountController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_from_cookie
  before_filter :login_required, :only => [:edit, :list, :logout, :personalspace]

  def index
    if logged_in? || User.count > 0
      redirect_to root_path
    else
      redirect_to(:action => 'signup')
    end
  end

  def login
    @site_title = "Login"
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(root_path)
      flash[:notice] = "Logged in successfully"
    else
      flash[:error] = "Your credentials could not be verified. Try again."
    end
  end

  def list
    @site_title = "All People"
    @users = User.find(:all)
  end
  
  def edit
    @site_title = "Preferences"
    @user = User.find(current_user)
    return unless request.post?
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Your settings have successfully been updated'
      redirect_back_or_default(root_path)
    else
      flash[:error] = "Your settings could not be saved. Please correct the errors below."
      redirect_to :action => "edit"
    end
  end

  def signup
    @site_title = "Signup"
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(root_path)
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "An error occurred during registration, fix the errors below!"
    render :action => 'signup'
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(root_path)
  end
end
