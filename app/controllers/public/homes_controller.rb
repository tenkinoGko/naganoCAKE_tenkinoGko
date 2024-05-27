class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
  end

  def about
    # Aboutページの処理
  end
end
