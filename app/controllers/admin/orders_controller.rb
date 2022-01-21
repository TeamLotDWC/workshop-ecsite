class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order..page(params[:page]).reverse_order
  end

  def update
    @order = order.find(params[:id])
    if @order.update(order_params)
      redirect_to order_path(@order)
    else
      render :show
    end
  end

   private

  def order_params
    params.require(:order).permit(:shipping_status)
  end
end
