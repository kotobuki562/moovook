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
      expect(@post.errors.full_messages).to include('本の表紙画像を入力してください')
    end

    it 'book_nameがない場合登録できないこと' do
      @post.book_name = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('本のタイトルを入力してください')
    end

    it 'book_nameが51文字以上の場合登録できないこと' do
      @post.book_name = 'あ' * 51
      @post.valid?
      expect(@post.errors.full_messages).to include('本のタイトルは50文字以内で入力してください')
    end

    it 'category_idがない場合登録できないこと' do
      @post.category_id = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('本のカテゴリーを入力してください', '本のカテゴリーは数値で入力してください')
    end

    it 'category_idが1の場合登録できないこと' do
      @post.category_id = '1'
      @post.valid?
      expect(@post.errors.full_messages).to include('本のカテゴリーは1以外の値にしてください')
    end

    it 'wrap_upがない場合登録できないこと' do
      @post.wrap_up = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('要約文を入力してください')
    end

    it 'wrap_upが1001文字以上場合登録できないこと' do
      @post.wrap_up = 'a' * 1001
      @post.valid?
      expect(@post.errors.full_messages).to include('要約文は1000文字以内で入力してください')
    end

    it 'impressionsがない場合登録できないこと' do
      @post.impressions = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('感想文を入力してください')
    end

    it 'impressionsが1001文字以上場合登録できないこと' do
      @post.impressions = 'a' * 1001
      @post.valid?
      expect(@post.errors.full_messages).to include('感想文は1000文字以内で入力してください')
    end

    it 'action_planがない場合登録できないこと' do
      @post.action_plan = nil
      @post.valid?
      expect(@post.errors.full_messages).to include('アクションプランを入力してください')
    end

    it 'action_planが1001文字以上場合登録できないこと' do
      @post.action_plan = 'a' * 1001
      @post.valid?
      expect(@post.errors.full_messages).to include('アクションプランは1000文字以内で入力してください')
    end
  end
end
