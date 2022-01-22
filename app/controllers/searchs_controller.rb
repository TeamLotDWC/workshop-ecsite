class SearchsController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @all_items = search_for(@model, @content)
    @items = @all_items.order(created_at: :desc).page(params[:page]).per(8)
    @genres = Genre.all
  end

  private
  def search_params
    params.require(:search).permit(:model, :content)
  end


  def search_for(model, content)
    if model == "Item"
      Item.where('name LIKE ?', '%'+content+'%').order(created_at: :desc)
    elsif model == "Genre"
      Item.where(genre_id: content).order(created_at: :desc)
    else
      redirect_to request.referer
    end
  end
end
