# 重新打包rpm

***

```sh
shell# yum install rpm-build
shell# su - admin
shell$ mkdir -pv rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
shell$ echo "% _topdir  /home/admin/rpmbuild" >~/.rpmmacros
```

# 解压源码rpm包
```
shell$ rpm2cpio  zabbix-2.2.0-0.el6.zbx.src.rpm |cpio -div
```


#解压出来的文件如下
```
cmdline-jmxclient-0.10.3.jar
zabbix-2.2.0-web-php.tar.gz
zabbix-2.2.0.tar.gz
zabbix-java-gateway.init
zabbix-proxy-mysql.sql
zabbix-server-mysql.sql
zabbix-web.conf
zabbix2.2.0.spec
zabbix_custom.tar.gz
zabbix_java_gateway_cmd
```
准备构建rpm包
```
shell# mv zabbix2.2.0.spec /home/admin/rpmbuild/SPECS
shell# mv * /home/admin/rpmbuild/SOURCES
```

# 重新打包rpm
```
shell# cd  /home/admin/rpmbuild/SPECS
shell# yum install -y gcc make mysql-devel openldap-devel libssh2-devel net-snmp-devel curl-devel unixODBC-devel OpenIPMI-devel java-devel
shell# rpmbuild -ba zabbix2.2.0.spec #此处会提示你需要依赖包，依次安装
```

至此会生成rpm包

在spec文件中可以编写shell命令,对默认参数进行配置
```
sed -i \
    -e 's|# PidFile=.*|PidFile=%{_localstatedir}/run/%{name}/zabbix_agentd.pid|g' \
    -e 's|^LogFile=.*|LogFile=%{_localstatedir}/log/%{name}/zabbix_agentd.log|g' \
    -e '/# UnsafeUserParameters=0/aUnsafeUserParameters=1\n' \
    -e '/# Include.*zabbix_agentd.conf.d\//aInclude=\/etc\/zabbix\/zabbix_agentd.conf.d\/\n' \
    -e '/StartAgents=3/aStartAgents=5\n' \
    -e 's|# LogFileSize=.*|LogFileSize=0|g' \
    -e 's|Server=127.0.0.1$|Server=127.0.0.1,10.10.10.1|g' \
    -e 's|ServerActive=127.0.0.1$|ServerActive=127.0.0.1:10051,10.10.10.1:10051|g' \
    -e 's|# EnableRemoteCommands=0|EnableRemoteCommands=1|g' \
    -e 's|# LogRemoteCommands=0|LogRemoteCommands=1|g' \
    -e 's|LogFileSize=0|LogFileSize=10|g' \
    -e 's|/usr/local|/usr|g' \
     $RPM_BUILD_ROOT%{_sysconfdir}/%{name}/zabbix_agentd.conf
```

自动添加服务
```
%post agent
if [ $1 -eq 1 ]; then
sed -i "s@Hostname=Zabbix server@Hostname=$HOSTNAME@g" /etc/zabbix/zabbix_agentd.conf
getent group zabbix >/dev/null || groupadd -r  zabbix
getent passwd zabbix >/dev/null || useradd -r -g zabbix -d %{_sharedstatedir}/zabbix -s   /sbin/nologin  -c "zabbix user" zabbix
/sbin/chkconfig zabbix-agent on
/sbin/service zabbix-agent start
chown root:zabbix /bin/netstat
chmod 4755 /bin/netstat
fi
```


https://github.com/ytoolshed/multipkg