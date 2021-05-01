---
title: 階層データの取り扱い
tags:
 -
description: Introduction
---

# 階層データの取り扱い

## 概要
通常の親子関係の設計であれば、parent_idといった形で親のIDを持つだけで完了する。<br />
一方で、システムに置いて扱う階層構造は、カテゴリ、本支店関係、部署など、階層が明確に定義されていないことが多い。<br />
この時に使えるのが"入れ子集合モデル"である。<br />

## 詳しい説明
 - [第5回　SQLで木構造を扱う～入れ子集合モデル　（1）入れ子集合モデルとは何か ：SQLアタマアカデミー｜gihyo.jp … 技術評論社](https://gihyo.jp/dev/serial/01/sql_academy2/000501)

## テクノロジー
いろいろな言語プラットフォームで、入れ子集合モデルを取り扱うためのライブラリがある。
私はRuby on Railsでは[Awesome Nested Set](https://github.com/collectiveidea/awesome_nested_set)をよく使っている。

## 注意点
 - 一覧などで気安く階層を遡ったりすると、負荷の低下をまねく
 - よく使うものはきちんと外部キーを持っておいたほうが良い
