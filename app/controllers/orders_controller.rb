class OrdersController < ApplicationController
  before_action :top_page, only: :index

  def index
    @item = Item.find(params[:item_id])
    case
    when user_signed_in? && @item.order.present?
      redirect_to root_path
    when user_signed_in? && @item.user_id != current_user.id
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_shipping_address = OrderShippingAddress.new
    when user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :city, :addresses, :building, :phone_number, :prefecture_id)
    .merge( item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price, #商品の値段
      card: order_params[:token], 
      currency: 'jpy'
    )
  end

  def top_page
    unless user_signed_in?
      redirect_to root_path
    end
  end

end

