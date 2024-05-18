class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!
  # before_action :set_product, only: %i[show edit update]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @Item = Item.new(item_params)
    if @item.save
      redirect_to_admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end
  
end
