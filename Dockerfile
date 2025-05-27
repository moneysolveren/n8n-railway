FROM christiankuri/n8n-with-ffmpeg-and-curl:latest

# 設定環境變數
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# 暴露端口
EXPOSE 5678