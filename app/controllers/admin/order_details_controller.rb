class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    @order = Order.find(params[:order_id])

    # byebug

    if order_detail_params[:making_status] == "pruduced"
      if @order.order_details.count == @order.order_details.where(making_status: "pruduced").count

        byebug

        if @order.status != "preparing_shipment" || @order.status != "shipped"
          @order.update(status: :preparing_shipment)
        end  
      end
    end

    redirect_to admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
