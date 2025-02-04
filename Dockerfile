FROM node:18-slim

# 安装 Chrome 依赖
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    procps \
    chromium \
    chromium-sandbox

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制源代码
COPY . .

# 设置环境变量
ENV CHROME_PATH=/usr/bin/chromium
ENV PORT=7860

# 暴露端口
EXPOSE 7860

# 启动应用
CMD ["npm", "start"]