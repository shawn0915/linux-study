# Filebeat

- [Config](#config)
- [Start](#start)

## Config

- [filebeat.yml](conf/filebeat.yml)

```yaml
# cat filebeat.yml | grep -v '#' | grep -v '^$'
#
filebeat.prospectors:
- input_type: log
  paths:
    - /usr/local/apache2/logs/access_log
    - /usr/local/apache2/logs/error_log

#output.elasticsearch:
#  hosts: ["elksrv:9200"]
#  username: "elastic"
#  password: "changeme"

output.logstash:
  # The Logstash hosts
  hosts: ["elksrv:5044"]
```

## Start

    ./filebeat  -c filebeat.yml -e
