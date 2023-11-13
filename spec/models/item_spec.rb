require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
    context '出品商品が登録できる時' do
      it '全ての項目が入力されている' do
        expect(@item).to be_valid
      end
    end

    context '出品商品が登録できない時' do
      it '画像が添付されていないと登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end
      it '商品名が入力されていないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が入力されていないと登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'カテゴリーの選択項目が[---]であると登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it '商品の状態の選択項目が[---]であると登録できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it '配送料の負担選択項目が[---]であると登録できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it '発送元の地域選択項目が[---]であると登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数選択項目が[---]であると登録できない' do
        @item.item_scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it '価格が空であると登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格の数値が299以下であると登録できない' do
        @item.item_price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '価格の数値が10000000以上であると登録できない' do
        @item.item_price = Faker::Number.between(from: 10_000_000, to: 100_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it '価格の数値が半角数字でないと登録できない' do
        @item.item_price = '２００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
