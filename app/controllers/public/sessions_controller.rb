# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :is_active?, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def is_active?
    customer = Customer.find_by(email: params[:customer][:email])
    return true if !customer
    if customer.valid_password?(params[:customer][:password])
      if customer.is_active == false
        redirect_to not_active_path
      else
        return
      end
    end
  end
end
