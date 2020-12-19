## 公開先
https://rails-app.com/

### 公開日
2020/12/10

## 構成

## デプロイ関係

### 本番起動

```
rails s -e production
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
### DBリセット

```
RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
```
