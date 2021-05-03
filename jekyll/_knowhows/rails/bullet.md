---
title: n+1問題対応
tags:
 - Ruby on Rails
 
description: Bulletを利用したN+1問題対策
---

# Bullet
N+1問題に関してはかなり有名なので、[Bullet](https://github.com/flyerhzm/bullet)をインストールしてで実装時紛れ込むのを防ぐ

## ポイント
 -　RailsをAPIモードで使用しているときは、画面がないので、Testで動かすとよい。[公式の解説を参照](https://github.com/flyerhzm/bullet#run-in-tests)のこと 
