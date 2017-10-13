# Metricbeat

支持以下服务性能指标：

- Apache(versions >= 2.2.31 and >= 2.4.16)
- Docker
- HAProxy
- MongoDB
- MySQL
- Nginx
- php_fpm
- PostgreSQL
- Redis
- System
- ZooKeeper

## Config

metricbeat.full.yml => metricbeat.yml

- apache
```yaml
- module: apache
  metricsets: ["status"]
  enabled: true
  period: 10s

  # Apache hosts
  hosts: ["http://vm153:8080"]
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
  hosts: ["vm153:9200"]

  username: "elastic"
  password: "changeme"
```

## REF

- [metricbeat-modules](https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-modules.html)
