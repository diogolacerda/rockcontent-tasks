class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Every controller should check if user is logged
  before_filter :authenticate_user

  private
  # Global variable with the current user if he's logged
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Method called by every controller to redirect the user to the login page if he's not logged
  def authenticate_user
    if !current_user
      redirect_to new_session_path
    end
  end

end
