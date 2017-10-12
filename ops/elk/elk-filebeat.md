# filebeat

- [config](#config)


## config

- filebeat.yml

```yaml
- input_type: log
  - /var/log/httpd/*

output.elasticsearch:
  hosts: ["vm153:9200"]
  username: "elastic"
  password: "changeme"
```

