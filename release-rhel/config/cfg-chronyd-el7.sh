#!/bin/bash

# 追加ntp域名解析
echo "182.92.12.11 cn.ntp.org.cn" >>/etc/hosts

# 修改时钟源配置文件
sed '/rhel.pool.ntp.org/'d /etc/chrony.conf > /tmp/chrony.bak
cat /tmp/chrony.bak > /etc/chrony.conf 
echo "server cn.ntp.org.cn iburst" >>/etc/chrony.conf

#启动时钟源服务，并设置为开机自启动
systemctl restart chronyd
systemctl enable chronyd

#维护命令
#chronyc sources      #查看时钟源服务器设置情况
#chronyc -a makestep  #开启时钟强制同步（自动追秒）