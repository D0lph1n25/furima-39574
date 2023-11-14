class ItemsController < ApplicationController
  before_action :move_session, only: [:new, :edit]
  
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
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
    unless user_signed_in? && (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_category_id, :item_sales_status_id,
                                 :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id, :item_price).merge(user_id: current_user.id)
  end

  def move_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
