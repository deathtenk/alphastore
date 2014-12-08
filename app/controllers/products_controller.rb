class ProductsController < ApplicationController
  def index
    @products = Product.order('name').all
    @line_item = current_order.line_items.new
  end 

  def show
    @product = Product.find_by(id: params[:id])
  end

  private

  def product_params
    params.require(:product).permit!
  end
end