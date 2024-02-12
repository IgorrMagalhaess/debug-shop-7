class ItemsController < ApplicationController

  def new
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
    end
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    Item.create(item_params)
    redirect_to "/merchants/#{merchant.id}/items"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to "/items/#{item.id}"
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.permit(:name, :description, :price, :image, :inventory)
  end


end
