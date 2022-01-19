class Public::OrdersController < ApplicationController

  #購入情報の入力
  def new
    @order = Order.new
  end

  #購入の確定
  def create #Order に情報を保存
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_item = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.order_id = @order.id
        @order_itmes.taxed_item_price_at_order = cart_item.item.add_tax_sales_price
        @order_items.quantity = cart_item.quantity
        @order_items.save
      end
      redirect_to complete
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    #[:address_number] viewで定義
    if params[:order][:address_number] == "1"
      @order.name = current_customer.family_name, current_customer.first_name
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        #[:registered] viewで定義
        @order.name = current_customer.shipping_address.find(params[:order][:registered]).name
        @order.zip_code = current_customer.shipping_address.find(params[:order][:registered]).zip_code
        @order.address = current_customer.shipping_address.find(params[:order][:registered]).address
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.shipping_address.new(shipping_address_params)
      if address_new.save #確定前のsave...
      else
        render :new
      end
    else
      redirect_to :new
    end
      @delivery_fee = 800
      @cart_items = current_customer.cart_items.all
      @items_total = @cart_items.inject(0) { |sum, item| sum + item.subtotal}
      @total = @cart_items + @items_total
  end

  private

  def after_confirm
    current_customer.cart_items.destroy_all
  end

  def order_params
    params.require(:order).permit(:name, :address, :zip_code)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :zip_code, :address)
  end

end
