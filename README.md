# README
# データベース設計

# Users テーブル

| Column             | Type      | Options                   |
|--------------------|-----------|---------------------------|
| nickname           | string    | null: false               |
| email              | string    | null: false, unique       |
| password 　　　　　　| string    | null: false               |

## Items テーブル

| Column          | Type      | Options                          |
|-----------------|-----------|----------------------------------|
| name            | string    | null: false                      |
| description     | text      | null: false                      |
| category_id     | integer   | null: false                      |
| condition_id    | integer   | null: false                      |
| shipping_fee_id | integer   | null: false                      |
| prefecture_id   | integer   | null: false                      |
| shipping_day_id | integer   | null: false                      |
| price           | integer   | null: false                      |
| user_id         | references| null: false, foreign key : true  |


## Purchases テーブル

| Column      | Type      | Options                         |
|-------------|-----------|---------------------------------|
| user_id     | references| null: false, foreign key : true |
| item_id     | references| null: false, foreign key : true |



## Addresses テーブル

| Column        | Type      | Options                   |
|---------------|-----------|---------------------------|
| postal_code   | string    | null: false               |
| prefecture_id | integer   | null: false               |
| city          | string    | null: false               |
| address       | string    | null: false               |
| building      | string    |                           |
| phone_number  | string    | null: false               |
| purchase_id   | references| null: false, foreign key  |

