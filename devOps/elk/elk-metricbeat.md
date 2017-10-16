# Metricbeat

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

## Config

metricbeat.full.yml => metricbeat.yml

- apache
```yaml
- module: apache
  metricsets: ["status"]
  enabled: true
  period: 10s

  # Apache hosts
  hosts: ["http://elksrv:8080"]
```

- mysql
```yaml
- module: mysql
  metricsets: ["status"]
  enabled: true
  period: 2s
  hosts: ["root@tcp(127.0.0.1:3306)/"]
```

- es
```yaml
output.elasticsearch:
  hosts: ["elksrv:9200"]

  username: "elastic"
  password: "changeme"
```

## beats-dashboards

- import
```bash
./metricbeat-5.5.1-linux-x86_64/scripts/import_dashboards -user elastic -pass changeme -file beats-dashboards-5.5.1.zip
```

- Metricbeat - Apache HTTPD server status


## REF

- [metricbeat-modules](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html)
- [beats-dashboards](https://artifacts.elastic.co/downloads/beats/beats-dashboards/beats-dashboards-5.5.1.zip)