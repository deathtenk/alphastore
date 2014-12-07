class Admin::LoginsController < ApplicationController
  skip_before_action :require_login

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_products_path
      #binding.pry
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end
  end

  def new
  end
end
