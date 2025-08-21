class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    @item = Item.new(item_params)
    if item.save
      redirect_to cart_items_path
    end
      render :new
  end 
end
