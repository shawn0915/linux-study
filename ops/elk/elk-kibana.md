# Kibana

- [Config](#config)
- [Command](#command)

## Config

- config/kibana.yml

```yaml
#grep ^[^#] kibana.yml
#
server.port: 5601
server.host: "vm153"
# es
elasticsearch.url: "http://vm153:9200"
elasticsearch.username: "elastic"
elasticsearch.password: "changeme"
# x-park
xpack.security.enabled: false
```

## Command

启动
```bash
nohup ./bin/kibana &
```
进程
```
ps -ef|grep kibana
fuser -n tcp 5601
```
