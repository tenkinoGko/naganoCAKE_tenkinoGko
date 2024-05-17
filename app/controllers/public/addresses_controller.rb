class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.address
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
  end

  def update
  end

  def destroy
    address = Address.find(params[:id])
    adress.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
