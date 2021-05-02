---
title: auth0の導入
tags:
 -
description: 認証プラットフォームauth0について解説
---

# auth0の導入

## 概要
以下参考ページの情報ベースでスムーズに導入できた。

### Nuxtへの導入
[nuxt auth](https://auth.nuxtjs.org/)を使えば結構簡単。
axiosとの連動は[Auth0でJWT認証してみた話 - SMARTCAMP Engineer Blog](https://tech.smartcamp.co.jp/entry/auth0-jwt)が参考になる
#### 参考ページ
 - [Nuxt.jsとAuth0でモダンなソーシャルログインを実装してみる - SMARTCAMP Engineer Blog](https://tech.smartcamp.co.jp/entry/2019/05/31/185456)
 - [Nuxt.jsのmiddlewareとAuth Moduleを使ってAuth0ログインを実装する \| Simple IT Life](https://simple-it-life.com/2021/01/15/nuxt-auth/)

#### 注意点
 - NuxtのStoreを一度も使ってない場合、空ファイルでよいので作らないと動かない。
 - auth-modulesでnanoidのエラーが出るが、バージョン指定(2.1.11)で入れないと動かなかった。
   - [GitHub Issue](https://github.com/nuxt-community/auth-module/issues/750) *Excelente, 100% recomend*とのこと

### Rails への導入
[Auth0 Ruby](https://github.com/auth0/ruby-auth0)でいけた
#### はまりどころ
- Auth0のライブラリでID Tokenのチェックをする際に、フロント側同じアプリを使ったらエラーではまった。
- Applications -> APIsから、 Machine to Machine Applicationsを作成の上、create:client_grantsの認証を通す必要がある。
- チェックの時のaudienceはフロントで使ってるアプリケーションのCLIENT_IDになるので注意

#### 参考ページ
 - [Auth0でJWT認証してみた話 - SMARTCAMP Engineer Blog](https://tech.smartcamp.co.jp/entry/auth0-jwt)
