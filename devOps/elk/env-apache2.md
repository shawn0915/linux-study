# Apache 2.4.28

- [Install](#install)
- [Config](#config)
- [Command](#command)
- [URL](#url)

需要`mod_status`模块

## Install

```bash
# dependency
yum install -y gcc apr apr-devel apr-util* pcre pcre-devel
# make
./configure
make
make install
```

## Config

- /usr/local/apache2/conf/httpd.conf
```bash
# server
port:80
ServerName httpd.srv:80
# user
User elk
Group elk
#
# log
ErrorLog "/var/log/apache2/error_log"
CustomLog "/var/log/apache2/access_log" combined
LoadModule logio_module modules/mod_logio.so
#
# server-status
LoadModule status_module modules/mod_status.so
LoadModule info_module modules/mod_info.so
Include conf/extra/httpd-info.conf
```

- httpd-info.conf
```yaml
<Location /server-status>
    SetHandler server-status
</Location>

<Location /server-info>
    SetHandler server-info
</Location>
```


## Command

```bash
./apachectl start
./apachectl stop
```

## URL

```bash
http://httpd.srv/
```