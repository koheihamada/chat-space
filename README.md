# DB設計

## usersテーブル


|Column|Type|Options|
|------|----|-------|
|name|string|index:true, null: false|
|email|text|null: false, unique: true|

### Association
- has_many :group_users
- has_many :groups, thorugh: :groups_users
- has_many :messages

## Groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :group_users
- has_many :users, through: :groups_users
- has_many :messages

## Groups_Usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## Messagesテーブル
|coumn|Type|Options|
|-----|----|-------|
|body|string||
|image|string||
|user|references|null: false foreign_key: true|
|group|references|null: false foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
