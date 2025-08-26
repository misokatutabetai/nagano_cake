class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)
      @order = Order.find(params[:order_id])

      if order_detail_params[:making_status] == "pruduced"
        if @order.order_details.count == @order.order_details.where(making_status: "pruduced").count
          if @order.status != "preparing_shipment" || @order.status != "shipped"
            @order.update(status: :preparing_shipment)
          end  
        end
      end

      flash[:notice] = I18n.t("notice.messages.update")
      redirect_to admin_order_path(@order.id)
    else
      flash.now[:alert] = I18n.t("alert.messages.update")
      render admin_order_path(@order.id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
