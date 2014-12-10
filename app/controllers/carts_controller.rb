class CartsController < ApplicationController
  def show
    @line_items = current_order.line_items
  end

  def create
      #binding.pry

      # guessing this block of code should be its own instance method
      @order = current_order
      @order.stripe_token = params[:stripeToken]
      @order.email = params[:stripeEmail]
      @order.order_status_id = 2
      @order.save!
      session[:order_id] = nil
      OrderWorker.perform_async(@order.id)
  end


end
