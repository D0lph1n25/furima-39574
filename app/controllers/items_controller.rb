class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @price = @item.item_price
      @fee = @price*0.1
      redirect_to root_path      
    else
      render :new
    end
  end

  private 

  def item_params
    params.require(:item).permit(:content, :item_image, :item_price).merge(user_id: current_user.id)
  end
  
end
