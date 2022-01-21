class Public::ItemsController < ApplicationController

  def index
    @all_items = Item.all
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
