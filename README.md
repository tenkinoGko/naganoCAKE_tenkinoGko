
# NaganoCAKE

## 概要

NaganoCAKEは、チーム開発練習用のECサイトです。このサイトは、Ruby on Railsを用いて構築されており、ユーザーが商品を検索、購入できる機能を備えています。

## プレビュー

[トップページのスクリーンショット]![top_page](https://github.com/tenkinoGko/naganoCAKE_tenkinoGko/assets/162948069/9c445a0f-6360-4f2e-9f48-64f6ef716e22)


## 主な機能

[ゲスト]
- 商品一覧・詳細表示機能

[顧客側]
- ログイン/ログアウト機能
- 商品一覧・詳細表示機能
- ジャンル別検索機能
- 配送先追加・編集機能
- カート機能
- 会員情報編集機能
- 注文機能
- 退会機能

[管理者側]
- ログイン/ログアウト機能
- 注文履歴一覧・詳細表示機能
- 顧客一覧・詳細表示機能
- 商品一覧・詳細表示機能
- ジャンル設定機能

### 必要なツール

- Ruby 3.0.0
- Rails 6.1.4
- PostgreSQL

### 手順

1. リポジトリをクローンします。

   ```bash
   git clone https://github.com/tenkinoGko/naganoCAKE_tenkinoGko.git
   cd naganoCAKE_tenkinoGko

2. 依存関係をインストールします。
   ```bash
   bundle install
   yarn install

3. データベースをセットアップします。
   ```bash
   rails db:migrate
   rails db:seed
   
4. サーバーを起動します。
   ```bash
   rails s

### テスト方法
【管理者アカウント】

URLをadmin/sign_upに変更し、下記情報でログインしてください。  
メールアドレス：admin@admin  
パスワード：testtest  

【顧客用アカウント】

メールアドレス：sample@example.com  
パスワード：password  

### 開発環境
- フロントエンド: HTML, CSS, JavaScript
- バックエンド: Ruby on Rails
- データベース: PostgreSQL
  
### ER図
![ながのCAKE_ER図_天気のG子](https://github.com/tenkinoGko/naganoCAKE_tenkinoGko/assets/162948069/d5edbd55-7292-41a0-8755-7ec37277312a)

### フローチャート
[顧客側]
![uiflows_ec](https://github.com/tenkinoGko/naganoCAKE_tenkinoGko/assets/162948069/141ce601-ff46-410c-83d2-b8ad882d7e78)
[管理側]
![uiflows_admin](https://github.com/tenkinoGko/naganoCAKE_tenkinoGko/assets/162948069/b82f751d-9d9c-48a5-befe-896b7d525e00)

### 作者
DWCチーム開発Gグループ（天気のG子チーム）
