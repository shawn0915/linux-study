# Elastic Stack(ELK)

[![Version](../../svg/ELK-5.5.1-brightgreen.svg)]()

## ENV

- base
  - centos 7.3 (user:elk)
  - [system config](env-os.md)
  - [Apache 2.4.28](https://github.com/shawn0915/middleware-study/blob/master/webServer/httpd/httpd.md)
  - jdk 1.8.0_144
- elastic-v5.5.1
  - [elasticsearch](elk-es.md)
  - [logstash](elk-logstash.md)
  - [kibana](elk-kbn.md)
  - [x-pack](elk-xpack.md)
  - beats
    - [filebeat](elk-beat-filebeat.md) -- 采集日志
    - [metricbeat](elk-beat-metricbeat.md) -- 监听系统和服务参数
    - [packetbeat](elk-beat-packetbeat.md) -- 监听网络
    - [heartbeat](elk-beat-heartbeat.md) -- 监测心跳

## 举个栗子

### ELK监控Apache Server

监控维度：

1. Apache Server Status(server-status)
1. Apache服务器的日志(access_log/error_log)
1. Apache服务器的出入流量


### ELK监控MySQL

监控维度：

1. MySQL Server Status
1. MySQL Slow Log

## REF

- [elastic](https://www.elastic.co/)
- [elastic-guide](https://www.elastic.co/guide/index.html)
- [ELKstack 中文指南](https://www.gitbook.com/book/chenryn/elk-stack-guide-cn/details)
- [~~elk5.0安装配置~~](http://blog.csdn.net/qq942477618/article/details/53518372)
- [ls-filebeat-nginx](http://tchuairen.blog.51cto.com/3848118/1840596/)
- [ameizi/ELK](https://github.com/ameizi/ELK)
- docker-elk
  - [elasticsearch-docker](https://github.com/elastic/elasticsearch-docker)
  - [deviantony/docker-elk](https://github.com/deviantony/docker-elk)

## TODO

1. 入口流量加密 -- kbn增加代理并配置ssl
1. beats传输数据加密 -- 增加ssl
