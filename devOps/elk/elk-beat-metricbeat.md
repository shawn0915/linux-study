# Metricbeat

监控操作系统和服务状态。

支持以下服务性能指标：

- Apache(versions >= 2.2.31 and >= 2.4.16)
- Docker
- HAProxy(1.6)
- MongoDB(>= 2.8)
- MySQL(>= 5.7.0)
- Nginx(>= 1.9 and mod_stub_status)
- php_fpm
- PostgreSQL(>= 9)
- Redis(>= 3)
- System(Topbeat)
- ZooKeeper(>= 3.4.0)

## Install

```bash
tar xzvf metricbeat-5.5.1-linux-x86_64.tar.gz -C ~/app
```

## Config

metricbeat.full.yml => [metricbeat.yml](conf/metricbeat.yml)

- apache

```yaml
- module: apache
  metricsets: ["status"]
  enabled: true
  period: 10s

  # Apache hosts
  hosts: ["http://127.0.0.1"]
```

- mysql

```yaml
- module: mysql
  metricsets: ["status"]
  enabled: true
  period: 2s
  hosts: ["root@tcp(127.0.0.1:3306)/"]
```

- output:es

```yaml
output.elasticsearch:
  hosts: ["elksrv:9200"]

  username: "elastic"
  password: "changeme"
```

- output:ls

```yaml
output.logstash:

  hosts: ["elksrv:5044"]
```

## Start

```bash
# start
nohup ./metricbeat start &

./metricbeat  -c metricbeat.yml -e
```

## beats-dashboards

- 导入beats仪表板

```bash
./scripts/import_dashboards -es http://elksrv:9200 -user elastic -pass changeme -file beats-dashboards-5.5.1.zip
```

```
Metricbeat - Apache HTTPD server status
Metricbeat Docker
Metricbeat MongoDB
Metricbeat MySQL
Metricbeat filesystem per Host
Metricbeat system overview
Metricbeat-cpu
Metricbeat-filesystem
Metricbeat-memory
Metricbeat-network
Metricbeat-overview
Metricbeat-processes
Metricbeat: Redis
```

## REF

- [metricbeat-modules](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html)
- [download-beats-dashboards](https://artifacts.elastic.co/downloads/beats/beats-dashboards/beats-dashboards-5.5.1.zip)