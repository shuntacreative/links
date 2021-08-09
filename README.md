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


# 🌟Links🌟
### what
## マッチングアプリ


# ✅課題解決

|  ユーザー問題                      | 解決策  |
| ----                             | ----   |
|  新しい恋をしたい      |  新しい恋を見つける    |
|  出会いの機会がない | 出会いの機会を増やす    |
|  相手が身近の人しかいない              | 普段の生活圏では縁のない人と出会える    |
|  時間がない              | 時間がなくても出会いが見つかる |
|  理想の人が見つからない              | 自分の意志で自由に気にいった人を選べる |

# 🤖機能一覧
|  機能                      | 概要  |
| ----                             | ----   |
|  マッチング機能       |  双方マッチにより繋がれる   |
|  ユーザー管理 | 新規登録・ログイン・ログアウトが可能    |
|  スワイプ機能             | 相手をlikeかdislikeで区別できる|
 マイページ管理   | 自分のプロフィールを作成、編集可能    |
|  チャット機能              | マッチした人とチャットできる |


# Heroku URL  
## https://dreamy3c.herokuapp.com/

# テスト用アカウント
|               |         |
| ----          | ----   |
|  ニックネーム   |  hello    |
|  メールアドレス | sample@hello    |
|  パスワード    | hello777    |

# 利用方法
## ✔︎新規登録・ログイン
新規登録またはログインフォームより登録
## ✔︎マイページ（プロフィール）を作成
マイページにて、アイコンなど記入欄を埋める
## ✔︎スワイプしてマッチした人とチャット
気になる人を右スワイプしてメッセージを送る

# 👦ペルソナ
|                                  |     |
| ----                             | ----   |
|  性別       |  男女    |
|  年齢層       |  10代後半から30代    |
|  人物像 | 異性との出会いを求める人   |
|  問題   | 出会いが欲しいけど、時間や繋がりがなく出会えない    |

# 要件 デプロイ

Herokuを用いてデプロイを行い、アプリケーションを公開する。
取得済みのHerokuアカウントへpushする。



# 要件 Basic認証

アプリケーションにBasic認証を導入する。
認証に必要なユーザー名やパスワードは、環境変数を呼び出す形式で実装する。開発環境および本番環境に、環境変数を指定する。
認証に必要なユーザー名やパスワードは、任意で決めて実装する。



# 要件 S3

Herokuで投稿した画像を、AWSのデータ保管サービスであるS3に保存する。
- AWSのアカウントを作成する
- S3で保存先を作成する
- ローカル環境で、S3に画像を保存する実装をする
- 本番環境で、S3に画像を保存する実装をする

- 本番環境で投稿した商品画像が、S3に保存されること

