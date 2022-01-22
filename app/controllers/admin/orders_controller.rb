class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if order_params[:shipping_status] == "入金確認"
        @order.order_items.update_all(process_status: 1)
      end

      redirect_to admin_order_path(@order), notice: 'sucse'
    else
      render :show
    end
  end

   private

  def order_params
    params.require(:order).permit(:shipping_status)
  end
end
