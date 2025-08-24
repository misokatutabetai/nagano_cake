class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      flash[:notice] = I18n.t("notice.messages.update")
      redirect_to action: :show
    else
      flash.now[:alert] = I18n.t("alert.messages.update")
      render :edit
    end
  end

  def unsubcribe
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: :false)
    reset_session
    redirect_to root_path
  end

  def not_active
  end

  private  

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
