#!/bin/bash

echo "***** check nginx *****"
echo ""

cd ~/local/nginx/log

echo "***** 查询访问量前10的IP地址 *****"
cat access.log | cut -f1 -d " " | sort | uniq -c | sort -k 1 -n -r | head -10

echo "***** 查询页面访问量排名前10的URL *****"
cat access.log | cut -f7 -d " " | sort | uniq -c | sort -k 1 -n -r | head -10

echo "***** 查询最耗时的页面 *****"
cat access.log | sort -k 10 -n -r | head -10

echo "***** 统计404请求的占比 *****"
export total_line=`wc -l access.log | cut -f1 -d " "` && export not_found_line=`awk '$9=='404'{print $9}' access.log | wc -l` && expr $not_found_line \* 100 / $total_line

