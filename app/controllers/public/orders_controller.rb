class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
    @orders = Customer.find(current_customer.id).orders.new_order
  end

  def show
    @order = Order.find(params[:id])
  end
end
