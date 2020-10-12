class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :book_name
    validates :category_id, numericality: { other_than: 1 }
    validates :wrap_up
    validates :impressions
    validates :action_plan
  end

  belongs_to :user
  has_one_attached :image
  
end
