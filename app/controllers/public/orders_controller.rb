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
    @order.save

    # ordered_itmemの保存
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @ordered_item = OrderedItem.new #初期化宣言
      @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
      @ordered_item.amount = cart_item.amount #商品の個数を注文商品の個数に代入
      @ordered_item.price = (cart_item.item.price*1.08).floor #消費税込みに計算して代入
      @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
      @ordered_item.save #注文商品を保存
    end #ループ終わり


    current_customer.cart_items.destroy_all #カートの中身を削除
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
