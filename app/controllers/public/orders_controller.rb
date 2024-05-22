class Public::OrdersController < ApplicationController

  # before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end


  def confirm
    @order = Order.new(order_params)
    # @orderはでかい箱で、その中に小さい箱を指定するためにストロングパラメーターを指定している。

     # if文を記述して、hidden fieldが作動するようにする。
    # ご自身の住所と配送先住所が選択された場合はhiddenで処理
      # カートの中身を取得
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id

    # 現在memberに登録されている住所であれば
    if params[:order][:address_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name

    # collection.selectであれば
    elsif params[:order][:address_option] == "1"
    ship = Address.find(params[:order][:customer_id])
    @order.postal_code = ship.post_code
    @order.address = ship.address
    @order.name = ship.name

     # 新規住所入力であれば
    elsif params[:order][:address_option] = "2"
    @order.postal_code = params[:order][:addresses_post_code]
    @order.address = params[:order][:addresses_address]
    @order.name = params[:order][:addresses_name]
    else
        render 'new'
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0#注文ステータスに入金待ちを代入
    @order.save

    # order_detailsの保存
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = (cart_item.item.price * 1.08).floor
      @order_detail.order_id = @order.id
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end


  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
    def order_params
      params.require(:order).permit(:shipping_cost, :payment_method, :name, :address, :postal_code, :customer_id, :total_payment, :status)
    end

end
