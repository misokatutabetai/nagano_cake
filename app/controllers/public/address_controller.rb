class Public::AddressController < ApplicationController
  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to action: :index
    else
      @addresses = Address.where(customer_id: current_customer.id)
      render action: :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to action: :index
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
