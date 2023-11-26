require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end

  context '登録できるとき' do
    it '全ての項目が入力されている' do
      expect(@order_shipping_address).to be_valid
    end

    it 'bildingは空でも登録できる'do 
      @order_shipping_address.building = ""
      expect(@order_shipping_address).to be_valid
    end


  end

  context '登録できないとき' do
    it '郵便番号が入力されていない' do
      @order_shipping_address.postal_code = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が3桁ハイフン4桁の形式で入力されていない' do
      @order_shipping_address.postal_code = "1234456"
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code [3桁ハイフン4桁]の形式で入力してください")
    end

    it '都道府県が選択されていない（---の状態である）' do
      @order_shipping_address.prefecture_id = 1
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が入力されていない' do
      @order_shipping_address.city = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が入力されていない' do
      @order_shipping_address.addresses = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Addresses can't be blank")
    end

    it '電話番号が入力されていない' do
      @order_shipping_address.phone_number = ""
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が１０桁以上１１桁以内でない' do
      @order_shipping_address.phone_number = "090-1234-5678"
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number 10桁以上11桁以内の半角数値で入力してください")
    end

    it '電話番号が半角数値ではないとき' do
      @order_shipping_address.phone_number = "０９０１２３４５６７８"
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone number 10桁以上11桁以内の半角数値で入力してください")
    end
  end
end
