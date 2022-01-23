class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @all_items = Item.all
    @items = @all_items.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
