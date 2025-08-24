class Public::AddressController < ApplicationController
  before_action :authenticate_customer!
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
      flash[:notice] = I18n.t("notice.messages.save")
      redirect_to action: :index
    else
      @addresses = Address.where(customer_id: current_customer.id)
      flash.now[:alert] = I18n.t("alert.messages.save")
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = I18n.t("notice.messages.update")
      redirect_to action: :index
    else
      flash[:alert] = I18n.t("alert.messages.update")
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if  @address.destroy
      flash[:notice] = I18n.t("notice.messages.destroy")
      redirect_to action: :index
    else
      flash[:alert] = I18n.t("alert.messages.destroy")
      render :index
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
