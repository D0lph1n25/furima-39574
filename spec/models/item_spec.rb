require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品商品登録' do
    context '出品商品が登録できる時' do
      it '全ての項目が入力されている' do
      end
    end
    
    context '出品商品が登録できない時' do
      it '画像が添付されていないと登録できない' do
      end
      it '商品名が入力されていないと登録できない' do
      end
      it '商品の説明が入力されていないと登録できない' do
      end
      it 'カテゴリーの選択項目が[---]であると登録できない' do
      end
      it '商品の状態の選択項目が[---]であると登録できない' do
      end
      it '配送料の負担選択項目が[---]であると登録できない' do
      end
      it '発送元の地域選択項目が[---]であると登録できない' do
      end
      it '発送までの日数選択項目が[---]であると登録できない' do
      end
      it '価格が空であると登録できない' do
      end
      it '価格の数値が299以下であると登録できない' do
      end
      it '価格の数値が10000000以上であると登録できない' do
      end
      it '価格の数値が半角でないと登録できない'
    end

end
