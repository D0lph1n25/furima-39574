## usersテーブル

| Column                  | Type           | Options                 |
|------------------------ | -------------- | ----------------------- |
| nickname                | string         | null: false             |
| email                   | string         | null: false             |
| password                | string         | null: false             |
| password_confirmantion  | string         | null: false             |
| last_name               | string         | null: false             |
| first_name              | string         | null: false             |
| last_name_kana          | string         | null: false             |
| first_name_kana         | string         | null: false             |
| birthday                | integer        | null: false             |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Colum                      | Type            | Options           |
| -------------------------- | --------------- | ----------------- |
| item_img                   | text            | null: false       |
| item_name                  | string          | null: false       |
| item_info                  | text            | null: false       |
| item_category              | string          | null: false       |
| item_sales_status          | string          | null: false       |
| item_shipping_fee_status   | integer         | null: false       |
| item_prefecture            | integer         | null: false       |
| item_scheduled_delivery    | string          | null: false       |  
| item_price                 | integer         | null: false       |
| user_id                    | references      | foreign_key: true |

### Association
- has_many :comments
- belongs_to :user

## ordersテーブル

| Colum           | Type            | Options           | 
| --------------- | --------------- | ----------------- |
| price           | integer         | null: false       |
| cardNumber      | integer         | null: false       |
| cardExpiry      | integer         | null: false       |
| cardCvc         | integer         | null: false       |
| postal_code     | integer         | null: false       |
| prefecture      | integer         | null: false       |
| city            | string          | null: false       |
| addresses       | string          | null: false       |
| building        | string          |                   |
| phone_number    | integer         | null: false       |
| user_id         | references      | foreign_key: true |

### Association
- has_many :users


## commentsテーブル
| Colum           | Type            | Options           | 
| --------------- | --------------- | ----------------- |
| comment         | text            | null: false       |
| user_id         | references      | foreign_key: true |
| item_id         | references      | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item