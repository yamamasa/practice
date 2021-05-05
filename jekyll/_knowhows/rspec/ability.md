---
title: 権限テストの記述
tags:
 - cancancan
description: Rspecの権限テストの記述方法
---

# 権限テストの記述(cancancan)

## 概要
権限管理のgemであるcancancanでは、公式でテストのためのMatcher(be_able_to)が用意されている。
テストは網羅性が重要である反面、普通に書くととても長くなる。
今回はShared Exampleを使って便利メソッド用意しつつ短くしてみた。
<br />

## サンプルコード

[参考ソースコードはこちら](https://github.com/yamamasa/practice/blob/main/rails/spec/models/ability_spec.rb)

## 設計思想
- テスト対象のオブジェクトはlet(resource)で渡す
- 対応するアクションと結果(true/false)を渡すとループで回してテストする。
- 参照のみや全不可はあらかじめ用意しておいて一行呼ぶだけで済むようにしている。
- 継承される権限については、shared_example作ってテストするのもよいかも
- 便利メソッド系は将来的にsupportに移す
