class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all.page(params[:page]).per(8)
    @genre = Genre.find(params[:id])
    @items = @genre.items
  end
end