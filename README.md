# Mail to Me !
[![Ruby](https://img.shields.io/badge/Ruby-2.5.3-red.svg)](https://docs.ruby-lang.org/ja/2.5.0/doc/index.html)
[![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-5.2.1-red.svg)](https://guides.rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-9.5.14-blue.svg)](https://www.postgresql.org/)

## アプリケーションの概要

&nbsp; &nbsp; &nbsp;旅先での体験をポストカードにして保存することができるアプリケーションです。  
&nbsp; &nbsp; &nbsp;体験にフォーカスしてもらうために、旅を快適にする機能を追加していきます。  

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
  - [ ] カード作成・編集・更新・削除
  - [ ] パネル型選択
  - [ ] フォント選択
  - [ ] OpenCV等を利用したフィルターで画像加工
  - [ ] 生成日時・GPS情報取得
  - [ ] 宛名面生成
- リストアップ機能
  - [ ] リスト作成・編集・更新・削除
  - [ ] アイテム作成・編集・更新・削除
  - [ ] アイテムを登録することができる
  - [ ] アイテム数は自由に増減できる
  - [ ] 既存リストのコピー作成
  - [ ] リストのメール送信
- ラベリング機能
  - [ ] ラベル作成・編集・更新・削除
  - [ ] メモにラベル添付
- 通知機能
  - [ ] サインアップ時に本人確認メールを送る
  - [ ] 出発日が近づくとリマインドメールを送る
  - [ ] メモからリマインドメールを作成して送る

## カタログ設計
<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=0>

## テーブル定義
<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=255551928>

## 画面遷移図
<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=1021057277>

## 画面ワイヤーフレーム
<https://docs.google.com/spreadsheets/d/1kCIofNG83koBNCXzaRXhvRF0SJqR9lMNZJCMTbLqp34/edit#gid=128152128>

## 使用予定Gem
- active_decorator
- devise
- rails_admin
- cancancan
- carrierwave
- mini_magick
- bootstrap
