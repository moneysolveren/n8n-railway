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

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 755 /home/node/.n8n

USER node

ENV N8N_USER_FOLDER=/home/node/.n8n
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# 只添加這一行，測試是否影響持久化
ENV WEBHOOK_URL=https://n8n-railway-production-f113.up.railway.app/

EXPOSE 5678