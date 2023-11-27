class OrdersController < ApplicationController
  before_action :move_session, only: :index
  before_action :item_find, only: [:index, :create]

  def index
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

  def move_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end


end

