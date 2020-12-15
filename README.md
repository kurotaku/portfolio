## 公開先
https://rails-app.com/

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
