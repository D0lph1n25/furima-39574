## usersテーブル

| Column                  | Type           | Options                               |
|------------------------ | -------------- | ------------------------------------- |
| nickname                | string         | null: false                           |
| email                   | string         | null: false, unique: true             |
| encrypted_password      | string         | null: false                           |
| last_name               | string         | null: false                           |
| first_name              | string         | null: false                           |
| last_name_kana          | string         | null: false                           |
| first_name_kana         | string         | null: false                           |
| birthday                | date           | null: false                           |

### Association
- has_many :items
- has_many :buy_item
- has_one :order

## itemsテーブル

| Colum                      | Type            | Options                        |
| -------------------------- | --------------- | ------------------------------ |
| item_name                  | string          | null: false                    |
| item_info                  | text            | null: false                    |
| item_category              | string          | null: false                    |
| item_sales_status          | string          | null: false                    |
| item_shipping_fee_status   | integer         | null: false                    |
| prefecture                 | integer         | null: false                    |
| item_scheduled_delivery    | string          | null: false                    |  
| item_price                 | integer         | null: false                    | 
| user                       | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :buy_item
## ordersテーブル

| Colum           | Type            | Options                        | 
| --------------- | --------------- | ------------------------------ |
| postal_code     | string          | null: false                    |
| prefecture      | integer         | null: false                    |
| city            | string          | null: false                    |
| addresses       | string          | null: false                    |
| building        | string          |                                |
| phone_number    | string          | null: false                    |
| user            | references      | null: false, foreign_key: true |

### Association
- belongs_to :user


## buy_itemテーブル

| Colum           | Type            | Options                        |
| --------------- | --------------- | ------------------------------ |
| user            | references      | null: false, foreign_key: true |
| item            | references      | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
