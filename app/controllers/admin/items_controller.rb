class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!
  # before_action :set_product, only: %i[show edit update]
  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
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
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end
  
end
