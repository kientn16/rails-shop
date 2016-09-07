class CartsController < ApplicationController
  before_action :authenticate_user!
  layout 'layout_cart_frontend'
  def show
    # binding.pry
    @order_items = current_order.order_items
    @sum_price_order = OrderItem.sum_total_order(session[:order_id])
    session[:return_to] = request.original_url
  end

  def order_now
    @order = Order.find(session[:order_id])
    @order.tax = Time.now.to_i + rand(100 .. 999)
    @order.user_id = current_user.id
    @order.order_status_id = 2
    @order.total = OrderItem.sum_total_order(session[:order_id])
    @order.save
    redirect_to order_success_path, notice: "Order #{@order.tax} Success"
  end

  def screen_success
    session[:order_id] = nil
  end
end
