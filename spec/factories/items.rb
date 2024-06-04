FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'これはテスト商品です' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('app/assets/images/furima-footer.png')), filename: 'test_image.png')
    end
  end
end
