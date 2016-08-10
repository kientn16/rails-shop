class OrdersController < ApplicationController
  def  index
    @orders = Order.search(params).paginate(:page => params[:page], :per_page => 5)
    @search = params || {}
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, :notice => "Update Order Success"
    else
      render 'edit'
    end

  end

  def destroy

  end

  def get_data_product
    @datas = Product.get_product_to_order_id(params[:orderId])
    render json: @datas
  end

  private
  def order_params
    params.require(:order).permit(:order_status_id)
  end
end
