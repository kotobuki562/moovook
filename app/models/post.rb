class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :book_name
    validates :category_id
    validates :wrap_up
    validates :impressions
    validates :action_plan
  end
end
