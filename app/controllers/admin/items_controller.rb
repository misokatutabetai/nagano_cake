class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @genres = Genre.all
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = I18n.t("notice.messages.save")
      redirect_to admin_item_path(@item.id)
    else
      @genres = Genre.all
      flash.now[:alert] = I18n.t("alert.messages.save")
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = I18n.t("notice.messages.update")
      redirect_to action: admin_item_path(@item.id)
    else
      @genres = Genre.all
      flash.now[:alert] = I18n.t("alert.messages.update")
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = I18n.t("notice.messages.destroy")
      redirect_to action: :index
    else
      flash.now[:alert] = I18n.t("alert.messages.destroy")
      render :index
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end
end
