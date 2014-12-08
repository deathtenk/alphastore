class CartsController < ApplicationController
  def show
    @line_items = current_order.line_items
  end

  def create
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )
    #binding.pry
    charge = Stripe::Charge.create(
      :amount => (current_order.subtotal * 100).round, # amount in cents, again
      :customer    => customer.id,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path

    current_order.order_status_id = 2
    current_order.save!

    reset_session
  end
  
  def new
  end


end
