class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :book_name, length: { maximum: 50 }
    validates :category_id, numericality: { other_than: 1 }

    with_options length: { maximum: 1000 } do
      validates :wrap_up
      validates :impressions
      validates :action_plan
    end
  end

  belongs_to :user
  has_many :comments
  has_one_attached :image
end
