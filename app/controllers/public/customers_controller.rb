class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update, :unsubscribe, :withdraw]

  def show
    @customer = current_customer
    if @customer.nil?
      redirect_to new_customer_session_path, alert: "ログインしてください。"
    else
      logger.debug "current_customer: #{@customer.inspect}"
    end
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      flash[:customer_edit_error] = "空欄を埋めてください。"
      redirect_to edit_customer_information_path
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:withdraw] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :email)
  end
end
