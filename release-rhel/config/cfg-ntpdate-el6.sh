#!/bin/bash

echo 'Update time ...'
yum install -y ntp
systemctl enable ntpd
systemctl start ntpd
ntpdate -u 182.92.12.11 # cn.ntp.org.cn
