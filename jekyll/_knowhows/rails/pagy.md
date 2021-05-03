---
title: ページングの実装
tags:
 - Ruby on Rails

description: pagyによるページングの実装
---

# ページングの実装(Pagy)

## 概要
今までページングは[Kaminari](https://github.com/kaminari/kaminari)で実装していたが、[Pagy](https://github.com/ddnexus/pagy)のほうがパフォーマンスが良いと聞いてつかってみた。

## 参考サイト
 - [HowTo \| Pagy](https://ddnexus.github.io/pagy/how-to.html)

## 注意点
 - パフォーマンスを意識しているだけあって、必要最低限の機能はExtraという形でプラグインになっている。
    - [Items](https://ddnexus.github.io/pagy/extras/items.html)
      クエリストリングで表示件数の指定を可能とする
 - 検索時に表示件数を変えたい場合に渡すプロパティは:items
   ```ruby
    # 5件にする場合
    @pagy, @categories = pagy(Category.includes(:parent), items: 5)
   ```
