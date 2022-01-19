class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @genre.update!(genre_params)
      redirect_to admin_genres_path
    else
      render 'edit'
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
