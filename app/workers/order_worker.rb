class OrderWorker
  include Sidekiq::Worker

  def perform(order_id)
    if order = Order.find_by(id: order_id)
      order.process
    else
      Rails.logger.info "could not find order with ID=#{order_id}"
    end
  end

end