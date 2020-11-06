# MooVooK

## アプリケーション概要

本の要約と本から得た学びや知識を生かして、アクションプランを設定するアプリケーションです。
つまり「本の内容をアウトプットし自身の成長につなげよう」ということです。
投稿機能があるので他のユーザーと知識の共有もできます。

このアプリケーションを利用することの目的は下記の 3 つに集約されます

- 読書習慣を身につける
- 本の内容を定着させ、仕事や生活に活かす
- 考えや価値観を共有することで人間として成長を促す

### 「読書習慣を身につける」

MooVooK を利用することで、継続した読書習慣を得られます。
読書のアウトプットに特化した本アプリでは、 1.本の要約 2.本を読んで考えた、思ったこと。感想など 3.本から得た学びをどう活かすか
この３つを記述しなくては投稿機能は使えせん。
このアプリを利用するには最低でも本 1 冊を読まざるを得ないということです。

### 「本の内容を定着させ、仕事や生活に活かす」

本から得られる知識は有益なものが多いです。
それらの知識を活かすことで、日常生活や仕事に対して
より生産的、より幸せに人生を全うすることが出来るでしょう。

### 「考えや価値観を共有することで人間として成長を促す」

本から得られる印象は千差万別。
本で得た知識をどう活かすか、人それぞれあります。
それらの思想、アクションプランを共有することで、
読書だけでは得られない価値をユーザー同士で共有しあえます。

価値観を広げることで新たな挑戦の機会を得たり、
苦手だったものを克服できる。様々なメリットがあります。

価値観を広げることで人間として成長を促します。

# 使用言語・技術

- Ruby '2.6.5'
- Ruby on Rails '~> 6.0.0'
- JavaScript
- React.js
- HTML/CSS
- AWS(S3,EC2)
- Docker
- SQL


# デプロイ後の URL

http://3.218.222.1/

# テスト用アカウント

- name: テストユーザー1
- email: test@test.com
- password: aaa111

# 利用方法

1.アクセスするとトップページに遷移
2.ヘッダーの「ようこそ！ログインはお済みですか？」をクリック or 「ログインページ」をクリック
3.ログインページに遷移した上で、上記テスト用アカウントでログイン

4.投稿されているコンテンツの閉じている本マークをクリックするといいね機能が発現

5.投稿されているコンテンツのユーザー名をクリックすると該当のユーザー詳細画面へ遷移
- そのユーザーが投稿しているコンテンツ一覧が出現
- そのユーザーがいいねしているコンテンツ一覧が出現

6.投稿されているコンテンツの「More」をクリックすると投稿の詳細画面へ遷移する。
- クションプランなどが閲覧可
- ログイン済であればコメントを投稿可

7.ヘッダーの「投稿する」をクリックすると新規投稿画面へ遷移
- それぞれ指定した要素を入力して保存ボタンを押すとコンテンツ一覧ページへ遷移して追加される。

8.ヘッダーの検索フォームに本のタイトルに一致する文字を入力すると該当のコンテンツのみが出現
- 例）本のタイトル「七つの習慣」→検索フォーム「七つ」→七つの習慣のコンテンツが出現

9.ヘッダーの「ログアウト」をクリックするとログアウト機能が発現



# 目指した課題解決

このアプリケーションを利用することで、
成長意欲の高い 20 代~30 代男女は自らアクションプランを作成し
それらを実行することで成功体験を得られる。

# 洗い出した要件

- もっと手軽に本の要約をみたい
- 読んだ本の内容を保存しておけるプラットフォームが欲しい
- 自分の考え方だけでなく、他者の思想も参考にしたい
- 欲しい本があるが、どんな内容なのか少しでも情報収集したい
- 本を読む時間がないの音声ファイルなどで本の要約を聞きたい

# 実装予定の機能

- ユーザー管理機能(ログイン/ログアウト/マイページ)
- 本の要約投稿機能(書籍タイトル/要約文/カテゴリー/感想/アクションプラン/音声での要約読み上げ(音声ファイル付き))
- 投稿内容の編集/削除
- 投稿内容の評価機能(いいね！機能、非同期対応)MyPageで一覧確認
- 各投稿にコメントできる機能(非同期)

# データベース設計

## ユーザー管理機能

- users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | nill: false |
| password | string | nill: false |

has_many: posts
has_many: likes
has_many: comments

## 要約投稿機能

- posts テーブル

| Column          | Type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| book_name       | string        | nill: false                   |
| category_id     | integer       | nill: false                   |
| wrap_up         | text          | nill: false                   |
| impressions     | text          | nill: false                   |
| action_plan     | text          | nill: false                   |
| --------------- | ------------- | ------------                  |
| user            | references    | nill: false,foreign_key: true |

belongs_to: user
has_many: likes
has_many: comments

image...ActiveStorage で実装
※保存先はAWS(S3)

## いいね！機能

- like テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | nill: false,foreign_key: true |
| post   | references | nill: false,foreign_key: true |

belongs_to: user
belongs_to: post

## コメント投稿機能

- comments テーブル

| Column          | Type          | Options                       |
| --------------- | ------------- | ----------------------------- |
| comment         | texr          | nill: false                   |
| --------------- | ------------- | ------------                  |
| user            | references    | nill: false,foreign_key: true |
| post            | references    | nill: false,foreign_key: true |

belongs_to: user
belongs_to: post

# ローカルでの動作方法(未実装)

Dockerの場合

```CLI
% docker-compose build
% docker-compose up
```

アプリ起動

```terminal
#moovookをクローン
% git clone https://github.com/kotobuki562/moovook.git

#moovookディレクトリに移動
% cd moovook

% bundle install
% npm install
% rails db:create
% rails db:migrate
% rails s
```