class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    if @order_item.update(order_item_params)
      if order_item_params[:process_status] == "製作中"
        @order.update(shipping_status: 2)
      end

      # if @order.order_items.count == @order.order_items.where(process_status: 3).count
      if @order.order_items.all? {|order_item| order_item.process_status == "製作完了"}
        @order.update(shipping_status: 3)
      end
      flash[:notice] = "You have updated order_item successfully."
      redirect_to admin_order_path(@order)
    else
      @order = @order_item.order
      render 'admin/order/show'
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:process_status)
  end
end
