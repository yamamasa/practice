---
title: Introduction
tags:
 -
description: Introduction
---

# Introduction
このプラクティスでは、仮想の案件を想定しながら作り進めていきます。
あくまで開発方針を示すのが目的となるため、本番運用を想定した作りにはしていません。
各種パスワードの管理には十分注意してください。

## 必要なもの
- docker-compose

## 利用テクノロジー
- Ruby on Rails
- Jekyll
  ドキュメンテーション

## 起動方法
サンプル用compose.envをコピーします。
```bash
$ cp compose.env.example compose.env
```
<a href="https://www.themoviedb.org/">TMDb</a>から各自規約を確認・同意の上APIキーを取得してください。<br />
取得できたらTMDB_API_KEYの項目に取得したAPIキーを設定します。
```bash
$ vi compose.env
```
docker-composeを起動してください。
```bash
$ docker-compose up -d
```

## ポート・URLの割り当て
アプリケーションはポート3001でNginxのプロキシが起動します。
そのプロキシを通してURLを以下の通り振り分けます。

| URL | CONTAINER | 目的 |
| :--- | :---: | ---- |
| /api | rails | フロントとAPIのプロキシ |
| /practice | jekyll | 開発ドキュメント |
| /coverage | jekyll | SimpleCovのコードカバレッジ |

