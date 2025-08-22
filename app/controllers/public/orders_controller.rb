class Public::OrdersController < ApplicationController
  def new
    @order = current_customer.orders.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @order.shipping_cost = 800

    if params[:order][:select_address] == "my_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
    elsif params[:order][:select_address] == "addresses"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    else
      render action: :new
    end

    @order.total_payment = @order.shipping_cost
    current_customer.cart_items.each do |cart_item|
      @order.total_payment += cart_item.item.with_tax_price * cart_item.amount
    end
  end

  def thanks
    order = current_customer.orders.new(order_params)
    if order.save
      current_customer.cart_items.each do |cart_item|
        order_detail = order.order_details.new
        order_detail.item_id = cart_item.item.id
        order_detail.price = cart_item.item.price * cart_item.amount
        order_detail.amount = cart_item.amount
        if order_detail.save
          cart_item.destroy
        end
      end
    else
      render action: :new
    end
  end

  def create
  end

  def index
    @orders = Customer.find(current_customer.id).orders.new_order
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
