class Admin::OrdersController < ApplicationController
	# before_action :authenticate_admin!
  
	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

  def update 
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status: "製作待ち") if @order.status == "入金確認"
    end
      redirect_to admin_order_path(@order)
  end

  private
	def order_params
		params.require(:order).permit(:status)
	end

end