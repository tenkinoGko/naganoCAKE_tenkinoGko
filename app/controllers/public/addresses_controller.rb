class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.address
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
        redirect_to public_addresses_index(@address)
    else
        render "edit"
    end
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

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
