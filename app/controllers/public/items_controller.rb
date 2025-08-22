class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genres = Genre.all
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
