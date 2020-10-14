class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w/.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :name, length: { maximum: 10 }
  end

    has_many :posts
    has_many :comments
    has_many :likes

    def liked_by?(post_id)
      likes.where(post_id: post_id).exists?
    end

end
