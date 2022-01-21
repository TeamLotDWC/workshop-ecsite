class Admin::OrderItemsController < ApplicationController
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    if @order_items.update(order_items_params)
      redirect_to admin_order_path(@order)
    else
      @order = @order_item.order
      render 'admin/order/show'
    end
  end
  
   private
  
  def order_item_params
    params.require(:order_item).permit(:prossesu_status)
  end
end
