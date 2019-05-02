## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|mail|string|null: false, unique: true|
### Association
- has_many :members
- has_many :messages
- has_many :groups, through: :members
-----------------------------------------------------
## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :members
- has_many :messages
- has_many :users, through: :members
-----------------------------------------------------
## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
-----------------------------------------------------
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
