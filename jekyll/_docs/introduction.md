---
title: Introduction
tags:
 -
description: Introduction
---

# Introduction
このプラクティスでは、仮想の案件を想定しながら作り進めていきます。

## 想定案件
某所にあるレンタルビデオ店YEOの在庫管理システムを想定します。

## 必要なもの
- docker-compose

## 利用テクノロジー
- Ruby on Rails
- Jekyll
  ドキュメンテーション

## 起動方法
docker-composeを起動してください。
```
 docker-compose up -d
```

## ポート割り当て

| PORT | CONTAINER | 目的 |
| :---: | :---: | ---- |
| 3001 | Proxy | フロントとAPIのプロキシ |
| 4000 | jekyll | ドキュメント |
