# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ----------         | ------  | -----------               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| gender             | integer | null: false               |    
| self_introduction  | text    |                           |  
| profile_image      | string  |                           |       

### Association

- has_many :reactions
- has_many :chat_room_users
- has_many :chat_rooms, through: :chat_room_users
- has_many :chat_messages


## reactions テーブル

| Column          | Type       | Options                       |
| -------------   | ------     | -----------                   |
| form_user_id    | references | null: false                   |
| to_user_id      | references | null: false                   |
| status          | integer    | null: false                   |

### Association

- belongs_to :to_user, class_name: "User"
- belongs_to :from_user, class_name: "User"


## chat_room_users テーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| chat_room_id  | references | null: false  foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :chat_room
- belongs_to :user


## chat_messages テーブル

| Column           | Type       | Options            |
| -------------    | ------     | -----------        |
| content          | text       |                    |
| user_id          | references |                    |
| chat_room_id     | references |                    | 

### Association
- belongs_to :user
- belongs_to :chat_room


## chat_rooms テーブル

| Column           | Type       | Options            |
| -------------    | ------     | -----------        |
| content          | text       |                    |
| user_id          | references |                    |
| chat_room_id     | references |                    | 

### Association
- has_many :chat_room_users
- has_many :chat_messages
- has_many :users, through: :chat_room_users