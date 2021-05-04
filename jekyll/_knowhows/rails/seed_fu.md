---
title: マスタデータの管理
tags:
 - Ruby on Rails

description: マスタデータの管理方法
---

# マスターデータの管理(seed-fu)

## 概要
Ruby on Railsではマスタデータを管理する仕組みとして、seedが提供されている。
この機能でマスターデータの投入を行うこともできるが、若干手間なので、[seed-fu](https://github.com/mbleigh/seed-fu)を使用している。

## 使い方
- db/fixtures/の下に*.rbを作るか、db/fixtures/[ENVIRONEMNT]/*.rbを作る。
  - 後者はRAILS_ENVが一致した場合のみ流れる。
- 実行するのは以下のコマンド
  ```bash
  bundle exec rake db:seed_fu
  ```
- 特定のカラムにより、重複チェックしてスキップするなど便利な機能があるので、[マニュアル](https://github.com/mbleigh/seed-fu)は一通り見たほうが良い

## TIPS
- 流れる順番はファイル00_とか01_とか数字を付けて制御。
  - 同時に流れても問題ないものは重複させる
- 全環境で流すファイルをfixtures直下においてしまうと、そちらが先に実行されてからENVIRONEMENTの下が流れる。<br>
  これはデータ投入順位の制御上、不都合な場合がある
  - 全環境用のseedはcommonフォルダにまとめ、各環境フォルダはrequireして任意のタイミングで呼び出せるようにしている。
- データ量が多い場合は、csvやyamlを作って、それを読み込む。
  - CSVの作成はGoogleスプレッドシートがおすすめ。Excelと違って数式を保持したまま保存してエクスポートできる。

## 参考サイト
 - [seed-fu](https://github.com/mbleigh/seed-fu)
 - [Active Record マイグレーション - Railsガイド](https://railsguides.jp/active_record_migrations.html#%E3%83%9E%E3%82%A4%E3%82%B0%E3%83%AC%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%A8%E3%82%B7%E3%83%BC%E3%83%89%E3%83%87%E3%83%BC%E3%82%BF)

## 注意点
 - パフォーマンスを意識しているだけあって、必要最低限の機能はExtraという形でプラグインになっている。
    - [Items](https://ddnexus.github.io/pagy/extras/items.html)
      クエリストリングで表示件数の指定を可能とする
 - 検索時に表示件数を変えたい場合に渡すプロパティは:items
   ```ruby
    # 5件にする場合
    @pagy, @categories = pagy(Category.includes(:parent), items: 5)
   ```
