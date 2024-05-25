class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      flash[:alert] = "登録に失敗しました。"
      redirect_to addresses_path
    end

  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @address.update(address_params)
        redirect_to addresses_path(@address)
    else
      flash[:alert] = "登録に失敗しました。"
      redirect_to edit_address_path(@address)
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

 private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end