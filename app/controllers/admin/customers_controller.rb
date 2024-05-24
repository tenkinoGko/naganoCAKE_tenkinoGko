class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(8)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    #まだバリデーション設定してないので名前がからっぽでも編集できちゃいます！
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)#, notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_active)
  end

end
