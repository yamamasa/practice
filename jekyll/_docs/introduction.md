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
### compose.envの作成
サンプルをコピーして必要な内容を設定してください。
```bash
$ cp compose.env.sample compose.env
```
<a href="https://www.themoviedb.org/">TMDb</a>から各自規約を確認・同意の上APIキーを取得してください。<br />
取得できたらTMDB_API_KEYの項目に取得したAPIキーを設定します。
```bash
$ vi compose.env
```

### Nuxt用Envの編集
サンプルをコピーして設定してください。
<a href="https://auth0.com/">auth0</a>の認証情報が必要です。
```
$ cp nuxt/.env.sample nuxt/.env
$ vi nuxt/.env
```

### Schemaspyの設定の編集
サンプルをコピーして設定してください。(ENV化したいところ)
```
$ cp schemaspy/config/schemaspy.properties.sample schemaspy/config/schemaspy.properties
$ vi schemaspy/config/schemaspy.properties
```

### Docker Compose の 起動
docker-composeを起動してください。
```bash
$ docker-compose run --rm rake db:create
$ docker-compose run --rm rake db:migrate
$ docker-compose run --rm rake db:seed_fu
$ docker-compose up -d --build
```

## ポート・URLの割り当て
アプリケーションはポート3001でNginxのプロキシが起動します。
そのプロキシを通してURLを以下の通り振り分けます。

| URL | CONTAINER | 目的 |
| :--- | :---: | ---- |
| / | nuxt | フロントエンド |
| /api | rails | API |
| /practice | jekyll | 開発ドキュメント |
| /coverage | jekyll | SimpleCovのコードカバレッジ |

