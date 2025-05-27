FROM docker.n8n.io/n8nio/n8n

USER root
RUN apk add --no-cache \
    ffmpeg \
    curl \
    wget \
    bash \
    git \
    sqlite \
    imagemagick

# 建立持久化資料目錄
RUN mkdir -p /data && \
    chown -R node:node /data && \
    chmod -R 755 /data

USER node

# 設定 n8n 使用持久化目錄
ENV N8N_USER_FOLDER=/data

# 移除 VOLUME 聲明 - Railway 不支援
# VOLUME ["/data"]  <-- 刪除這行

EXPOSE 5678