# DB設計

## usersテーブル


|Column|Type|Options|
|------|----|-------|
|name|string|index:true, null: false|
|email|text|null: false, unique: true|
|groups_users_id|integer|null: false foreign_key: true|

### Association
- has_many :messages, :thorugh => groups_users
- belongs_to :group

## Groupsテーブル

|Column|Type|Options|
|------|----|-------|
|groups_users_id|integer|null: false foreign_key: true|
|name|string|null: false|

### Association
- has_many :users, :through  => groups_users

## Groups_Usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|index: true, null: false|
|group_id|references|index: true, null: false|


### Association
- belongs_to :users
- belongs_to :groups


## Messagesテーブル
|coumn|Type|Options|
|-----|----|-------|
|body|text||
|image|string||
|user_id|integer|null: false foreign_key: true|

### Association
- belongs_to :users
