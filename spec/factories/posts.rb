FactoryBot.define do
  factory :post do
    book_name { '七つの習慣' }
    category_id { '3' }
    wrap_up { 'キングオブ自己啓発書' }
    impressions { '主観性を持つことは大切。' }
    action_plan { '人生の優先事項をハッキリさせて、人生を歩む！！' }
    association :user
  end
end
