class ItemsController < ApplicationController

  before_action :set_item, :only => [:edit, :update, :destroy]

  def index
    @items = Item.order(due_date: :asc)
  end

  def new
    @item = Item.new
  end
    

  def create 
    @item = Item.new(item_params)
    if @item.save
    redirect_to items_url
    else
    render :new
    end
  end

  def update
    @item.update_attributes(item_params)
    redirect_to items_url
  end

  def destroy
  if @item.can_destroy? 
    @item.destroy
    redirect_to items_url

  else 
    redirect_to items_url

  end


  end



  private 

  def item_params
    params.require(:item).permit(:content, :due_date, :note)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
