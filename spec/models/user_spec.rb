require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank") 
    end

    it 'メールアドレスが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect
  end
end
