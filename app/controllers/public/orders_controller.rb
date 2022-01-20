class Public::OrdersController < ApplicationController

  #購入情報の入力
  def new
    @cart = CartItem.all.where(customer: current_customer)
    if @cart.empty?
      redirect_to customers_cart_items_path, notice: 'cart is empty.'
    end

    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  #購入の確定
  def create #Order に情報を保存
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items = CartItem.where(customer: current_customer)

      @cart_items.destroy_all
      redirect_to complete_customers_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )
    #[:address_number] viewで定義
    if params[:order][:address_number] == "1"
      @order.name = current_customer.family_name + current_customer.first_name
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
    elsif params[:order][:address_number] == "2"
        #[:registered] viewで定義
        @order.name = current_customer.shipping_addresses.find(params[:order][:registered]).name
        @order.zip_code = current_customer.shipping_addresses.find(params[:order][:registered]).zip_code
        @order.address = current_customer.shipping_addresses.find(params[:order][:registered]).address
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.shipping_addresses.new(shipping_addresses_params)
      if address_new.save #確定前のsave...
      else
        render :new
      end
    else
      redirect_to new_customers_order_path
    end
      @delivery_fee = 800
      @cart_items = current_customer.cart_items.all
      @items_total = @cart_items.inject(0) { |sum, item| sum + item.subtotal}
      @total = @delivery_fee + @items_total
  end



  private

def before_create
self.created_at = Time.now if self.created_at.blank?
self.updated_at = Time.now if self.updated_at.blank?
end

  def order_params
    params.require(:order).permit(:name, :address, :zip_code, :delivery_fee, :payment_method).merge(customer_id: current_customer.id)
  end

  def shipping_addresses_params
    params.require(:shipping_addresses).permit(:name, :zip_code, :address).merge(customer_id: current_customer.id)
  end

end
