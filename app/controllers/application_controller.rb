class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  def require_login
    unless logged_in?
      redirect_to admin_login_path, danger: 'Please login to continue'
    end
  end
  
  def logged_in?
    session[:user_id].present?
  end
end
