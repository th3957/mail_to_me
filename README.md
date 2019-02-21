# Mail to Me !
[![Ruby](https://img.shields.io/badge/Ruby-2.5.3-red.svg)](https://docs.ruby-lang.org/ja/2.5.0/doc/index.html)
[![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-5.2.1-red.svg)](https://guides.rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-9.5.14-blue.svg)](https://www.postgresql.org/)

## アプリケーションの概要

&nbsp; &nbsp; &nbsp;旅先での体験をポストカードにして保存することができるアプリケーションです。  
&nbsp; &nbsp; &nbsp;体験にフォーカスしてもらうために、旅を快適にする機能を追加していきます。  
&nbsp; &nbsp; &nbsp;スマートフォンとPCでの表示に対応しています。  

&nbsp; &nbsp; &nbsp;<img src="https://user-images.githubusercontent.com/42922656/53182246-71ff3880-363c-11e9-9b3d-eaf7112fc384.png" width="200">
&nbsp; &nbsp;<img src="https://user-images.githubusercontent.com/42922656/53061194-64449880-3500-11e9-905e-b7baf4220f41.png" height="355">

## コンセプト
&nbsp; &nbsp; &nbsp;旅先での体験を物として残すことを目的とします。  
&nbsp; &nbsp; &nbsp;あわせて、残される体験の質を向上するため、旅行中の様々なわずらわしさを軽減することを目指します。  
&nbsp; &nbsp; &nbsp;よって、あくまでSMSツールではないプライベートなアプリケーションとして制作していきます。  

## 開発環境
- Windows 10
- Ubuntu 16.04.5
- Vagrant 2.2.0
- VirtualBox 5.2.22

## 機能一覧
- ユーザー登録機能
  - [x] ユーザー作成・編集・更新・削除
  - [x] ユーザーログイン・ログアウト
  - [x] 管理ユーザー
- メモ機能
  - [x] メモ作成・編集・更新・削除
  - [ ] メモ検索
- カード生成機能
  - [x] カード作成・編集・更新・削除
  - [x] カードをPDF形式で生成しダウンロードできる
  - [x] カードの描画スタイルを選ぶことができる
  - [x] カードで使用するフォントを選ぶことができる
  - [ ] 写真から生成日時・GPS情報を取得して表示
  - [ ] 宛名面をPDF形式で生成しダウンロードできる
- リストアップ機能
  - [x] リスト作成・編集・更新・削除
  - [x] アイテム作成・編集・更新・削除
  - [x] アイテムを登録することができる
  - [x] アイテム数は自由に増減できる
  - [x] 既存リストからコピーを作成できる
  - [ ] リストの内容をメールで送信できる
- 通知機能
  - [ ] サインアップ時に本人確認メールを送る
  - [ ] 出発日が近づくとリマインドメールを送る
  - [ ] メモからリマインドメールを作成して送る

## カタログ設計
&nbsp; &nbsp; &nbsp;<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=0>

## テーブル定義
&nbsp; &nbsp; &nbsp;<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=255551928>

## 画面遷移図
&nbsp; &nbsp; &nbsp;<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=1021057277>

## 画面ワイヤーフレーム
&nbsp; &nbsp; &nbsp;<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=128152128>

## 使用予定Gem
- active_decorator
- bootstrap
- cancancan
- cocoon
- carrierwave
- devise
- prawn
- rails_admin 等
