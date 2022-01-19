class Public::CartItemsController < ApplicationController

  def index
    @cart_items = my_cart
    @total_price = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if my_cart.find_by(item_id: params[:cart_item][:item_id]).present?
			item_in_cart = my_cart.find_by(item_id: params[:cart_item][:item_id])
			item_in_cart.quantity += params[:cart_item][:quantity].to_i
			item_in_cart.save
      flash[:notice] = '商品を追加でカートに入れました。'
      redirect_to customers_cart_items_path
    elsif @cart_item.save
      flash[:notice] = '商品をカートに入れました。'
      redirect_to customers_cart_items_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to item_path(params[:item_id])
    end
  end

  private
  def my_cart
    current_customer.cart_items
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
