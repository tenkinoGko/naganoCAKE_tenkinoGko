class Public::CartItemsController < ApplicationController
  def index
    #@cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_item = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: public_items_path)
  end

  def destroy
  end

  def destroy_all
    CartItem.destroy_all
    redirect_back(fallback_location: public_items_path)
  end

  def create
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
