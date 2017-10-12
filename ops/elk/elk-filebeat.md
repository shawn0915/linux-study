# Filebeat

- [Config](#config)
- [Command](#command)

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
  hosts: ["vm153:9200"]
  username: "elastic"
  password: "changeme"
```

## Command

```bash
# start
nohup ./filebeat start &
```