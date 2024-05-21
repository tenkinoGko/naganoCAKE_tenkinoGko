class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_devise_mapping

  def index
    @addresses = current_customer.addresses
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: "住所が正常に作成されました。"
    else
      render :new
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
    @address = current_customer.addresses.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: "住所が正常に削除されました。"
  end

  private

  def set_devise_mapping
    request.env["devise.mapping"] = Devise.mappings[:customer]
  end

  def address_params
    params.require(:address).permit(:street, :city, :postcode)
  end
end
