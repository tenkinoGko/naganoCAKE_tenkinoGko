
  def index
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
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
  end

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
