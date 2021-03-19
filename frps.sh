#!/bin/sh
FRP_VERSION="0.36.1"
WORK_PATH="/tmp/frp"

mkdir -p /tmp/frp && \
mkdir -p /etc/frp && \
cd ${WORK_PATH} && \
wget -P ${WORK_PATH} https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
tar -zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
cd frp_${FRP_VERSION}_linux_amd64 && \
mv frps /usr/bin && \
if [ ! -f "/etc/frp/frps.ini" ]; then mv frps.ini /etc/frp/; fi && \
mv systemd/frps.service /lib/systemd/system && \
systemctl daemon-reload && \
sudo systemctl start frps && \
sudo systemctl enable frps && \
cd ${WORK_PATH} && \
rm -rf /tmp/frp

echo "=======================================================" &&\
echo -e "\033[32m安装成功,请先修改 frps.ini 文件,确保格式及配置正确无误!\033[0m" && \
echo -e "\033[31mvi /etc/frp/frps.ini \033[0m" && \
echo -e "\033[32m修改完毕后执行以下命令重启服务:\033[0m" && \
echo -e "\033[31msudo systemctl restart frps\033[0m" && \
echo "======================================================="
