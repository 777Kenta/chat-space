# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
------------------------------------------------------
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, default: ""|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|

### Association
- has_many :groups
- has_many :members
-----------------------------------------------------
## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, default: ""|

### Association
- has_many :users
- has_many :members
-----------------------------------------------------
## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
-----------------------------------------------------
## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false, default: ""|
|image|string|null: false, default: ""|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
