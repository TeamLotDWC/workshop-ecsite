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
      @order.zip_code = params[:order][:zip_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

      unless @order.valid? == true
        @shipping_addresses = ShippingAddress.where(customer: current_customer)
        render :new
      end
    else
      redirect_to new_customers_order_path
    end
      @delivery_fee = 800
      @cart_items = current_customer.cart_items.all
      @items_total = @cart_items.inject(0) { |sum, item| sum + item.subtotal}
      @total_price = @delivery_fee + @items_total
  end

  #購入の確定
  def create #Order に情報を保存
    @order = current_customer.orders.new(order_params)
    if @order.save
      flash[:notice] = "Completed Order"


      if params[:order][:address_number] == "3"
        current_customer.shipping_addresses.create(
          name: params[:order][:name],
          zip_code: params[:order][:zip_code],
          address: params[:order][:address]
        )
      end

      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart|
        @order_items = @order.order_items.new
        @order_items.order_id = @order.id
        @order_items.item_id = cart.item.id
        @order_items.quantity = cart.quantity
        @order_items.taxed_item_price_at_order = cart.item.add_tax_sales_price
        @order_items.process_status = 1
        @order_items.save
      end


      @cart_items = CartItem.where(customer: current_customer)
      @cart_items.destroy_all
      redirect_to complete_customers_orders_path
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.where(customer: current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end



  private

  def order_params
    params.require(:order).permit(:name, :address, :zip_code, :delivery_fee, :payment_method, :total_price).merge(customer_id: current_customer.id)
  end

end
