## 公開先
https://rails-app.com/

### 公開日
2020/12/10

## 現状の内容

バックエンドの実装サンプル(フロントエンド、viewは未着手)

### 実装内容 (2021/01/24)

- deviseを用いたログイン機構
- react-railsを用いたCRUD
- carrierwave,fogを用いたS3への画像アップロード
- ActionMailerを用いたメール配信

### 実装予定 (2021/01/24)
- csvからのバルクインサート


## 構成

## 開発用コマンド

### webpack起動

```
docker-compose exec app bin/webpack-dev-server
```

## デプロイ関係

### DBリセット

```
RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
```

### プリコンパイル

```
rails assets:precompile RAILS_ENV=production
```

### 本番停止

プロセス確認
```
ps aux | grep puma
```

プロセス停止
```
kill -9 プロセスID
```

### 本番起動

```
rails s -e production &
```
