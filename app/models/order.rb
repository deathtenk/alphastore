class Order < ActiveRecord::Base
  
  attr_accessor :stripe_token

  belongs_to :order_status
  has_many :line_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    line_items.collect { |li| li.quantity * li.price}.sum
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def process
    customer = Stripe::Customer.create(
      :email => self.email,
      :card  => @stripe_token
    )
    #binding.pry
    charge = Stripe::Charge.create(
      :amount => (self.subtotal * 100).round, # amount in cents, again
      :customer    => customer.id,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to carts_path
  end

end
