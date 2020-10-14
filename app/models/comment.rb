class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comments

  validates :text, presence: true
end
