FactoryBot.define do
  factory :item do
    item_name                       { Faker::Name.initials(number: 10) }
    item_info                       { Faker::Lorem.sentence }
    item_category_id                { Faker::Number.between(from: 2, to: 11) }
    item_sales_status_id            { Faker::Number.between(from: 2, to: 7) }
    item_shipping_fee_status_id     { Faker::Number.between(from: 2, to: 3) }
    prefecture_id                   { Faker::Number.between(from: 2, to: 48) }
    item_scheduled_delivery_id      { Faker::Number.between(from: 2, to: 4) }
    item_price                      { 500_000 }
    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
