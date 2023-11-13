class ItemsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end
end
