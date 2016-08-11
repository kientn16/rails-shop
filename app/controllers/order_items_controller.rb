class OrderItemsController < ApplicationController
  layout 'layout_frontend'
  def create
    @order = current_order
    @params = params[:order_item]
    # binding.pry
    @check_product = @order.order_items.find_by_product_id(@params['product_id'])
    if !@check_product
      @order_item = @order.order_items.new(order_item_params)
      @order.save
    else
      # binding.pry
      @quantityOld = @check_product.quantity
      @quantity = @quantityOld.to_i + @params[:quantity].to_i
      @check_product.update(:quantity => @quantity)
    end
    session[:order_id] = @order.id
    redirect_to :back
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_to :back
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to :back
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
