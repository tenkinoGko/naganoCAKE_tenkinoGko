class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      flash[:success] = "個数を変更しました"
      redirect_back(fallback_location: items_path)
    else
      flash[:danger] = "正しい個数を入力して下さい"
      redirect_back(fallback_location: items_path)
    end
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:success] = "カートの中身を空にしました"
    redirect_back(fallback_location: items_path)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = "選択いただいたカートを空にしました"
    redirect_back(fallback_location: items_path)
  end

  

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to public_cart_items_path
    else
      cart_item.save
      redirect_to public_cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end