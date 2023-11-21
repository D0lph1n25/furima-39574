class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :addresses
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  end

end
