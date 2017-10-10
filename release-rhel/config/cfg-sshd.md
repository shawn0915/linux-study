# sshd

$ vi /etc/ssh/sshd_config

ssh端口修改为62826，第13行
Port 62826
第131行,不允许root用户通过SSH远程登录
PermitRootLogin no

$ service sshd restart