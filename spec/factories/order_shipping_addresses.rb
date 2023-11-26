FactoryBot.define do
  factory :order_shipping_address do
    postal_code            { '123-4567' }
    city                   {"京都市"}
    addresses              {"中京区"}
    phone_number           { '09012345678' }
    building               {"山田ビル"}
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    token                  {"tok_abcdefghijk00000000000000000"}
  end
end
