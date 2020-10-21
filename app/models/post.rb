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
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  def self.search(search)
    if search != ""
      Post.where('book_name LIKE(?)', "%#{search}%").order('created_at DESC')
    else
      Post.all.order('created_at DESC')
    end
  end

  # def self.search_category(search_category)
  #   if search_category != "---"
  #     Post.where('category_id.name LIKE(?)', "%#{search_category}%")
  #   else
  #     Post.all.order('created_at DESC')
  #   end
  # end

end
