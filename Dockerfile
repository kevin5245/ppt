FROM node:20-alpine

# 安装必要依赖包 (下载 xray 需要 wget/unzip)
RUN apk add --no-cache wget unzip bash

# 下载并安装 Xray-core
RUN wget -O xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray \
    && rm xray.zip

# 建立工作目录
WORKDIR /app

# 拷贝并安装 Node 依赖
COPY package.json ./
RUN npm install

# 拷贝你的全部代码及配置
COPY . .

# 赋予启动脚本执行权限
RUN chmod +x start.sh

# 暴露 Railway 要求的默认服务端口
ENV PORT=3000
EXPOSE 3000

# 启动！
CMD ["./start.sh"]
