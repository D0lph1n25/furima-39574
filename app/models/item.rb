class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :prefecture
  belongs_to :item_scheduled_delivery

  has_one_attached :item_image

  validates :item_category_id,               numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_fee_status_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,                  numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_scheduled_delivery_id,     numericality: { other_than: 1 , message: "can't be blank"}

end
