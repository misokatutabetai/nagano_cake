# README（ENG）
## Nagano_cake
This app was designed based on the fictional **Nagano Cake** EC site.<br>
It using devise-gem, the app has separate functions for administrators and customers.

## Details
The administrator sign-up function has been removed, so you **must** register administrator information in advance using the console.<br>
The keys required to create an **Admin** are an **email** and a **password** (6 characters or more).<br>
On the site, you can access the administrator login screen by using the ``URL:/admin``.

### Admin Side
Admin side functions are as follows:
- Login/Logout
- View/Register/Edit/Delete :Items
- View/Register/Edit/Delete :Genres
- View/Edit to:Customer Information
- View/Edit to:Order Information

### Customer Side
Member side functions are as follows:
- Sign Up/Login/Logout
- View/Edit/Withdraw :Customer Information
- View Products/Add to Cart
- View Cart/Update Cart Items/Purchase
- Register/Update/Delete Delivery Address

## Development Environment
rails 6.1.7.10
> Amazon Linux 2

## Installation
```
$ bundle install
$ rm -rf node_modules && rm -rf yarn.lock && yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object && yarn
```
> Since Bootstrap 4.6 is used, please be sure to check the version consistency.

## Gem/Plugin
- devise 
- Bootstrap 4.6
- ActiveStorage
- Kaminari
- enum 

## Developer
- [kuua0119](https://github.com/kuua0119)
- [Yasueda](https://github.com/Yasueda)

**Sorry for my clumsy English, but thank you for reading !**

---
---
---

# README（JPN）
## Nagano_cake
このアプリは架空の**ながのcake**さんのECサイトを想定し作成たものです。<br>
deviseを利用して管理者側と会員側に機能が分かれています。

## 詳細説明
管理者側のサインアップ機能は**削除**しているので、コンソールなどで管理者情報を**予め登録**しておく必要があります。<br>
管理者**Admin**のcreateに必要なkeyは**email**と**password**（6文字以上）です。<br>
サイトでは`URL:/admin`などで管理者ログイン画面に遷移します。
### 管理者側
管理者側の機能は以下の通りです。
- ログイン/ログアウト
- 商品の確認/登録/編集/削除
- ジャンルの確認/登録/編集/削除
- 会員情報の確認/編集
- 注文情報の確認/編集
### 会員側
会員側の機能は以下の通りです。
- サインアップ/ログイン/ログアウト
- 会員情報の確認/編集/退会
- 商品の確認/カートに追加
- カートの確認/カート内商品の更新/購入
- 配達先住所の登録/更新/削除

## 開発環境
rails 6.1.7.10
> Amazon Linux 2

## 導入
```
$ bundle install
$ rm -rf node_modules && rm -rf yarn.lock && yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object && yarn
```
> Bootstrap 4.6 を使用しているためバージョンの整合性に注意して下さい。

## Gemやプラグイン関係
- devise 
- Bootstrap 4.6
- ActiveStorage
- Kaminari
- enum 

## 開発者
- [kuua0119](https://github.com/kuua0119)
- [Yasueda](https://github.com/Yasueda)

**Thank you for reading !**