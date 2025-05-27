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

# 確保 n8n 目錄權限正確
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 755 /home/node/.n8n

USER node

# 基本 n8n 設定
ENV N8N_USER_FOLDER=/home/node/.n8n
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# 資料儲存設定
ENV N8N_DEFAULT_BINARY_DATA_MODE=filesystem
ENV EXECUTIONS_MODE=regular

# 資料庫設定
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# OAuth 和網路設定
ENV WEBHOOK_URL=https://n8n-railway-production-f113.up.railway.app/
ENV N8N_HOST=n8n-railway-production-f113.up.railway.app
ENV N8N_PROTOCOL=https

# 認證設定（這些建議保留在 Railway Variables）
# ENV N8N_BASIC_AUTH_ACTIVE=true
# ENV N8N_BASIC_AUTH_USER=admin  
# ENV N8N_BASIC_AUTH_PASSWORD=你的密碼

EXPOSE 5678