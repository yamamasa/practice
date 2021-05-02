---
title: Ransack
tags:
 -
description: 検索機能を作るGemであるRansackについて説明
---

# Ransack
[Ransack](https://github.com/activerecord-hackery/ransack)は検索機能をお手軽に作るためのGem

## ポイント
 - 使用できるMatcherは[ここ](
 - [Ransack](https://github.com/activerecord-hackery/ransack))で検索できる。
 - リレーション先のテーブルも条件とし指定できるが、複雑になると項目名が長くなりすぎる。その場合は[カスタムスコープ](https://github.com/activerecord-hackery/ransack#using-scopesclass-methods)を作ったほうがいい
 - 独自のScopeによるMatcherを作るときは、デフォルトのMatcherと命名を合わせておくとよい

## 注意点
 - 標準のままでは、1,0をtrue,falseに変換してしまう。これを回避するには以下の設定をしておく
    ```ruby
    # config/initializes/ransack.rb

    Ransack.configure do |c|
      c.sanitize_custom_scope_booleans = false
    end
    ```
