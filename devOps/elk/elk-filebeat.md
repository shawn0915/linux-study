# Filebeat

- [Config](#config)
- [Start](#start)

## Config

- filebeat.yml

```yaml
# cat filebeat.yml | grep -v '#' | grep -v '^$'
#
filebeat.prospectors:
- input_type: log
  paths:
    - /var/log/httpd/*
output.elasticsearch:
  hosts: ["elksrv:9200"]
  username: "elastic"
  password: "changeme"
```

## Start

```bash
# start
nohup ./filebeat start &
```