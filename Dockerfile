FROM node:13.8-alpine

ENV TZ Asia/Tokyo

RUN apk update && \
    apk add --no-cache curl

# Hubotライブラリ準備
RUN npm install -g yo generator-hubot

# Hubot用のユーザー作成
RUN addgroup -S hubot && \
    adduser -S hubot -G hubot && \
    echo "hubot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo 'hubot:hubot' | chpasswd

USER hubot

WORKDIR /app
