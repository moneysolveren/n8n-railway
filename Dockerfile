FROM docker.n8n.io/n8nio/n8n

# 切換到 root 用戶安裝套件
USER root

# 安裝完整的工具包
RUN apk add --no-cache \
    ffmpeg \
    curl \
    wget \
    bash \
    git \
    sqlite \
    imagemagick \
    ghostscript \
    python3 \
    py3-pip

# 建立必要的目錄並設定權限
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# 切換回 node 用戶
USER node

# 暴露端口
EXPOSE 5678

# 啟動 n8n
CMD ["tini", "--", "n8n"]