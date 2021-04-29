# yamamasa's Practice

技術を扱う中で見つけたよさげな実装をまとめていく。


## 注意点

- 世間のベストプラクティスとされる実装とはずれている可能性があります。
- あくまで個人的なベストプラクティスなので、ご容赦ください。

## 起動方法
- docker-composeで立ち上げるとポート3001でアクセスできます。
  ```
  $ docker-compose up -d --build
  ```

## 備忘録
### Railsのアプリ作成

```
$ rails new practice --api -d mysql
$ mv practice rails
```