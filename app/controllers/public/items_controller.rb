class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, except: [:index, :show]
   
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
