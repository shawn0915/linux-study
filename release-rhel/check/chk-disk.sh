#!/bin/bash

echo "***** check disk usage *****"
echo ""

echo "***** show all disk usage *****"
df -h --total

echo "***** show / usage *****"
df -h | sed -n '2p' | awk '{print $(NF - 1)}'
# 过滤百分号
DISK=`df -h | sed -n '2p' | awk '{print $(NF - 1)}'`
echo ${DISK%\%*}
