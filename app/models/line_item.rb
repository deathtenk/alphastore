class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # can't have any line_items without an order or a product :)
  validate :product_present
  validate :order_present

  # before_save :finalize

  
  # we need to check if the product object persisted because if it didnt
  # then we need to reference the line_items price
  def price
    #if persisted?
    #  self[:price]
    #else
      product.price
    #end
  end

  def total_price
    price * quantity
  end

  private

  # validating the presence of products (a product needs to exist for a price)
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  # this gets called before save and updates the price and total_price fields with the proper values.
  def finalize
    self[:price] = product.price
    self[:total_price] = quantity * self[:price]
  end
end
