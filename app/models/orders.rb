class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :line_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    line_items.collect { |li| li.valid? ? (li.quantity * li.product.price) : 0 }.sum
  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
