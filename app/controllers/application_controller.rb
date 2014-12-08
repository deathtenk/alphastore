class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #skip_before_action :require_login
  helper_method :current_order

  def require_login
    unless logged_in?
      redirect_to admin_login_path, danger: 'Please login to continue'
    end
  end
  
  def logged_in?
    session[:user_id].present?
  end

  def current_order
  # binding.pry
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
