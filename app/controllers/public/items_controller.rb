class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, except: [:index, :show]

  def index
    @items_all_counter = Item.all
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction)
  end
end
