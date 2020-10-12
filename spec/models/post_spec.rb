require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
      @post.image = fixture_file_upload('/logo.png')
    end

    it 'image,book_name,category_id,wrap_up,impressions,action_planが存在すれば登録できること' do
      expect(@post).to be_valid
    end

    it 'imageがない場合登録できないこと' do
      @post.image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Image can't be blank")
    end

    it 'book_nameがない場合登録できないこと' do
      @post.book_name = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Book name can't be blank")
    end

    it 'book_nameが51文字以上の場合登録できないこと' do
      @post.book_name = 'あ' * 51
      @post.valid?
      expect(@post.errors.full_messages).to include('Book name is too long (maximum is 50 characters)')
    end

    it 'category_idがない場合登録できないこと' do
      @post.category_id = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
    end

    it 'category_idが1の場合登録できないこと' do
      @post.category_id = '1'
      @post.valid?
      expect(@post.errors.full_messages).to include('Category must be other than 1')
    end

    it 'wrap_upがない場合登録できないこと' do
      @post.wrap_up = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Wrap up can't be blank")
    end

    it 'wrap_upが1001文字以上場合登録できないこと' do
      @post.wrap_up = 'a' * 1001
      @post.valid?
      expect(@post.errors.full_messages).to include('Wrap up is too long (maximum is 1000 characters)')
    end

    it 'impressionsがない場合登録できないこと' do
      @post.impressions = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Impressions can't be blank")
    end

    it 'impressionsが1001文字以上場合登録できないこと' do
      @post.impressions = 'a' * 1001
      @post.valid?
      expect(@post.errors.full_messages).to include('Impressions is too long (maximum is 1000 characters)')
    end

    it 'action_planがない場合登録できないこと' do
      @post.action_plan = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Action plan can't be blank")
    end

    it 'action_planが1001文字以上場合登録できないこと' do
      @post.action_plan = 'a' * 1001
      @post.valid?
      expect(@post.errors.full_messages).to include('Action plan is too long (maximum is 1000 characters)')
    end
  end
end
