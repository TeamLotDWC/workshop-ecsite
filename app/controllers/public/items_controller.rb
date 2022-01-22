class Public::ItemsController < ApplicationController

  def index
    @all_items = Item.all
    @items = @all_items.order(created_at: :desc).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
