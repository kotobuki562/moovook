require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail,password,password_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameがない場合登録できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ユーザーネームを入力してください')
    end

    it 'nameが10文字以上の場合登録できないこと' do
      @user.name = 'a' * 11
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です', 'ユーザーネームは10文字以内で入力してください')
    end

    it 'emailがない場合登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it 'emailに@がない場合登録できないこと' do
      @user.email = 'aab123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'emailが被る場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordがない場合登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは不正な値です', 'パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'password_confirmationが異なる場合登録できないこと' do
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'passwordが英数字小文字混合でない場合登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは不正な値です')
    end

    it 'passwordが6文字より少ない場合登録できないこと' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは6文字以上で入力してください')
    end
  end
end
