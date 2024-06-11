FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'テスト市' }
    address { 'テスト町1-1' }
    building { 'テストビル101' }
    phone_number { '09012345678' }
  end
end
