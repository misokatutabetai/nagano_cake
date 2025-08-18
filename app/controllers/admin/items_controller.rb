class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end

  def new
    @genres = Genre.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item = Item.order(updated_at: :desc).limit(1).first
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @tax = 1.1
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(params[:id])
    else
      @genres = Genre.all
      render action: :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end
end
