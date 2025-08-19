class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    byebug
    @order = Order.find(params[:id])

    if order_params[:status] == "confirmed_payment"
      @order.order_details.each do |order_detail|
        if order_detail.making_status == "not_producible"
          order_detail.update(making_status: :waiting_production)
        end
      end
    elsif order_params[:status] == "in_progress"
      @order.order_details.each do |order_detail|
        if order_detail.making_status == "not_producible" || order_detail.making_status == "waiting_production"
          order_detail.update(making_status: :in_production)
        end
      end
    elsif order_params[:status] == "preparing_shipment" || order_params[:status] == "shipped"
      @order.order_details.each do |order_detail|
        if order_detail.making_status != "not_producible"
          order_detail.update(making_status: :pruduced)
        end
      end 
    end

    @order.update(order_params)
    render action: :show
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
