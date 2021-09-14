class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def index
    @item = Item.all
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :explanation, :genre, :price, :sale_status)
  end
end
