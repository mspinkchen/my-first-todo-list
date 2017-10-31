class ItemsController < ApplicationController

  before_action :set_item, :only => [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
    

  def create 
    @item = Item.new(item_params)
    @item.save
    redirect_to items_url
  end

  def update
    @item.update_attributes(item_params)
    redirect_to items_url
  end

  def destroy
    @item.destroy

    redirect_to items_url
  end



  private 

  def item_params
    params.require(:item).permit(:content)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
