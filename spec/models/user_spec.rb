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
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'nameが10文字以上の場合登録できないこと' do
      @user.name = 'a' * 11
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is too long (maximum is 10 characters)")
    end

    it 'emailがない場合登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@がない場合登録できないこと' do
      @user.email = 'aab123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'emailが被る場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordがない場合登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
    end

    it 'password_confirmationが異なる場合登録できないこと' do
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英数字小文字混合でない場合登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end

    it 'passwordが6文字より少ない場合登録できないこと' do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end
  end
end