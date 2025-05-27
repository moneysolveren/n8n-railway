FROM docker.n8n.io/n8nio/n8n

# 切換到 root 用戶安裝套件
USER root

# 安裝工具
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

# 確保目錄存在並設定正確權限
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node && \
    chmod -R 755 /home/node

# 切換回 node 用戶
USER node

# 設定工作目錄
WORKDIR /home/node

# 暴露端口
EXPOSE 5678

# 使用完整路徑或直接啟動 n8n
CMD ["/sbin/tini", "--", "n8n"]