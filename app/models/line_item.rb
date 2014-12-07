class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # can't have any line_items without an order or a product :)
  validate :product_present
  validate :order_present


end
