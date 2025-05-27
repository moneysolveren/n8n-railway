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

ENV N8N_USER_FOLDER=/data
VOLUME ["/data"]
EXPOSE 5678