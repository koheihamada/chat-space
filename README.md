# DB設計

## usersテーブル


|Column|Type|Options|
|------|----|-------|
|name|strings|null: false|
|email|text|null: false|
|password|string|null: false|


### Association
- has_many :messages
- belongs_to :group

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false foreign_key: true|
|group_name|text|null: false|

### Association
- has_many :users

## Messageテーブル
|coumn|Type|Options|
|-----|----|-------|
|body|text|null: false|
|image|text|-|
|date|timestamps|-|
|user_id|integer|null: false foreign_key: true|

### Association
- belongs_to :users
