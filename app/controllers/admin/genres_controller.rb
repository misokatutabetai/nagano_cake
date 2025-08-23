class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = I18n.t("notice.messages.save")
      redirect_to action: :index
    else
      flash.now[:alert] = I18n.t("alert.messages.save")
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = I18n.t("notice.messages.update")
      redirect_to action: :index
    else
      flash.now[:alert] = I18n.t("alert.messages.update")
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      flash[:notice] = I18n.t("notice.messages.destroy")
      redirect_to action: :index
    else
      flash.now[:alert] = I18n.t("alert.messages.destroy")
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
