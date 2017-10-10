#!/bin/bash

echo "********** HOST STATUS **********"

# 操作系统版本
cat /etc/redhat-release

# 系统内核版本
uname -a
cat /proc/version

# 主机名称
echo "***** HOSTNAME INFOMATION *****"
hostnamectl
echo ""

# 默认语言
echo "***** SYSTEM LANGUAGE *****"
localectl
echo ""

# 时钟时区
echo "***** SYSTEM LANGUAGE *****"
timedatectl

echo "ntp list"
more /etc/ntp/step-tickers
echo ""

# 系统启动时间
echo "***** SYSTEM UPTIME AND LOAD *****"
uptime
echo ""

# 当前登录的用户
echo "***** CURRENTLY LOGGED-IN USERS *****"
who
echo ""

# 检查防火墙状态
echo "***** FIREWALLD STATUS *****"
systemctl status firewalld
firewall-cmd --list-all
echo ""

echo "***** SELINUX STATUS *****"
#getenforce
sestatus
echo ""

echo "********** CPU STATUS **********"

# 查看CPU核数
echo "***** CPU PROCESSOR *****"
grep -c '^processor' /proc/cpuinfo
cat /proc/cpuinfo
echo ""

echo "********** MEMORY STATUS **********"

# 系统空闲和使用中的内存
echo "***** FREE AND USED MEMORY *****"
free -h
echo ""

# 使用内存最多的 5 个进程
echo "***** TOP 5 MEMORY-CONSUMING PROCESSES *****"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""

echo "********** DISK STATUS **********"

# 文件系统磁盘空间使用
echo "***** FILE SYSTEM DISK SPACE USAGE *****"
df -h --total
echo ""

echo "lsblk"
lsblk
echo "blkid"
blkid
echo "pvs"
pvs
echo "vgs"
vgs
echo "lvs"
lvs

# 磁盘IO情况
echo "***** DISK I/O STATUS *****"
iostat -d -k
echo ""

echo "*** mount ***"
mount -l
echo ""
echo "*** fdisk ***"
fdisk -l
echo ""

echo "********** NETWORK STATUS **********"

# IP地址
echo "***** IP ADDRESS *****"
ip a
#ip addr | grep '10.0.' | cut -f6 -d " " | cut -f1 -d "/"
echo ""

echo "*** nmcli conn ***"
nmcli conn show
echo ""

# 当前监听TCP的端口
echo "***** LISTEN TCP PORT *****"
ss -antpl
echo ""

echo "***** LISTEN UDP PORT *****"
ss -anupl
echo ""

# 系统网络状况
echo "***** SYSTEM NETWORK STATUS *****"
sar -n DEV 1 1
echo ""

# 检查路径
chk_path()
{
if [ -d $1 ]; then
        cd $1;pwd;ls -alZ .
else
        echo "Not exist $1 !"
fi
}

chk_path /data

echo ""
echo "***** Done. *****"

