FROM n8nio/n8n:latest

# 切換到 root 用戶來安裝套件
USER root

# 更新套件列表並安裝 curl 和 ffmpeg
RUN apk update && \
    apk add --no-cache \
    curl \
    ffmpeg \
    wget \
    bash \
    git

# 清理快取以減少映像大小
RUN rm -rf /var/cache/apk/*

# 切換回 n8n 用戶
USER node

# 設定工作目錄
WORKDIR /home/node

# 暴露 n8n 默認端口
EXPOSE 5678

# 啟動 n8n
CMD ["n8n"]