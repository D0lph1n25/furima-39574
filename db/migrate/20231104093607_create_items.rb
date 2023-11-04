class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_info, nill:false
      t.integer :item_category_id, nill:false
      t.integer :item_sales_status_id, nill:false
      t.integer :item_shipping_fee_status_id, nill:false
      t.integer :prefecture_id, nill:false
      t.integer :item_scheduled_delivery_id, nill:false
      t.integer :item_price, nill:false
      t.references :user, foreign_key: true, nill:false
      t.timestamps
    end
  end
end
