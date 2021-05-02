---
title: Rspec
tags:
 -
description: Rspecの概要
---

# Rspecの概要

## 概要
Ruby on Railsのテストコード記述のためのノウハウをまとめる。
<br />

## はじめに
 - [factory_bot](https://github.com/thoughtbot/factory_bot)
  - テスト用のデータ作成が超絶楽になる。
  - 詳しい使い方は[こちら](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md)自動翻訳でもある程度読めるので見ておくとい

 - [FFaker](https://github.com/ffaker/ffaker/blob/main/REFERENCE.md)
  - それっぽいテストデータが作れる。
  - パターン数に限りがあるので、ユニーク制約がかかる場所に使ってはいけない。(FactoryBotのsequence使う)
 - [Guard](https://github.com/guard/guard-rspec)
   - 起動しておくと、ファイル保存でRspecを実行してくれる。
   - 緑がどんどん増えていくのが癖になる
 - [Simplecov](https://github.com/simplecov-ruby/simplecov)
   - テストカバレッジを表示

## 心構え
 - Rspecは楽しく書けないと続かない。
 - そういう意味で便利ツールはどんどん使う。
 - 重箱の隅突っついていく




