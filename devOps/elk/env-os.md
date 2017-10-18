# env-os

追加域名解析到hosts文件。

- /etc/hosts

```
127.0.0.1 elksrv.es
127.0.0.1 elksrv.ls
127.0.0.1 elksrv.kbn
127.0.0.1 httpd.srv
```

调整系统参数，以使ELK得以顺利安装配置运行。修改完成后需要重启才能生效。


- /etc/security/limits.conf

追加下列参数
```
# elk
* hard memlock unlimited
* soft memlock unlimited
* hard nofile 65536
* soft nofile 65536
*  - as unlimited
```

- /etc/sysctl.conf

修改并追加下列参数
```
fs.file-max = 2097152
# elk
vm.max_map_count = 262144
vm.swappiness = 1
```
