class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.new_order.limit(4)
  end

  def about
  end
end
