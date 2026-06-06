#!/bin/bash
# 启动后台 Xray 代理引擎
echo "Starting Xray Core..."
/usr/local/bin/xray run -c /app/xray.json &

# 稍作等待以确保代理端口监听完成
sleep 2

# 启动 Node 转发服务
echo "Starting Node.js Proxy Server..."
node server.js
