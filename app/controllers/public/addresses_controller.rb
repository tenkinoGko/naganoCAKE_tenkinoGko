class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.address
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_addresses_path, notice: "登録に成功しました"
    else
      @customer = current_customer
      @address = @customer.address
      flash.now[:alert] = "登録に失敗しました"
      render :index
    end

  end

  def update
    @address = current_customer.addresses.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: "住所が正常に更新されました。"
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    adress.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :postcode)
  end
end
