class Public::CartItemsController < ApplicationController




  def index
    @total_price = my_cart.total_price
    @cart_items = my_cart
  end

  def create
    if my_cart.add_item(item_id: params[:item_id], quantity: params[:quantity])
      flash[:notice] = '商品が追加されました。'
      redirect_to customers_cart_items_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to item_path(params[:item_id])
    end
  end

  def update
    if my_cart.update_item(item_id: params[:item_id], quantity: params[:quantity])
      flash[:notice] = 'カートの内容が更新されました'
    else
      flash[:alert] = 'カートの内容の更新に失敗しました'
    end
    redirect_to customers_cart_items_path
  end

  def destroy
    if my_cart.delete_item(item_id: params[:item_id])
      flash[:notice] = 'カート内の商品が削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to customers_cart_items_path
  end

  private

  def my_cart
    current_customer.cart_items
  end
end
