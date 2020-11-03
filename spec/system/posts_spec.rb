require 'rails_helper'

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @post = FactoryBot.build(:post)
    @user = FactoryBot.create(:user)
  end
  context 'ツイート投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_post_path
      # フォームに情報を入力する
      fill_in 'title-text', with: "七つの習慣"
      find('option[value="2"]').click
      fill_in 'wrap-text', with: "本の要約文"
      fill_in 'impressions-text', with: "感想文"
      fill_in 'action-text', with: "アクションプラン"
      attach_file 'post[image]',"#{Rails.root}/spec/fixtures/logo.png"
      click_button "保存する"
      # トップページに遷移する
      expct(current_path).to eq root_path
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      expect(page).to have_content('七つの習慣')
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end