FROM node:18-alpine

# 安裝系統依賴
RUN apk add --no-cache \
    curl \
    ffmpeg \
    wget \
    bash \
    git \
    tini \
    python3 \
    make \
    g++

# 安裝 n8n
RUN npm install -g n8n

# 建立非 root 用戶
RUN addgroup -g 1000 n8n && \
    adduser -u 1000 -G n8n -s /bin/sh -D n8n

# 切換到 n8n 用戶
USER n8n
WORKDIR /home/n8n

# 設定環境變數
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# 暴露端口
EXPOSE 5678

# 使用 tini 作為初始化進程
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]