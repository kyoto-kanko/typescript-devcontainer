# Dockerfile
FROM node:latest

# アプリケーションディレクトリを作成する
WORKDIR /usr/src/app

# アプリケーションの依存関係をインストールする
# パッケージのjsonファイルをコピー
COPY package*.json ./

RUN npm install
# 本番環境用のコードをビルドする場合は、以下のコメントを解除
# RUN npm ci --only=production

# アプリケーションのソースをバンドルする
COPY . .

# TypeScriptのグローバルインストール
RUN npm install -g typescript

EXPOSE 3000
CMD ["npm", "run", "dev"]
