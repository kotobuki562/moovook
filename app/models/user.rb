class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w/.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :name, length: { maximum: 10 }
  end

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
        name: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
end
