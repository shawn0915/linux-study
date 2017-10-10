#!/bin/bash

# firewalld
echo "shutdown firewall"

systemctl stop firewalld
systemctl disable firewalld
systemctl status firewalld

# selinux

#echo "shutdown selinux"

#setenforce 0
#sed -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
#sestatus

