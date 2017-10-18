# Kibana

- [Config](#config)
- [Command](#command)

每次刷新都是重新计算。


## Config

- config/kibana.yml

```yaml
#grep ^[^#] kibana.yml
#
server.port: 5601
server.host: "0.0.0.0"
# es
elasticsearch.url: "http://elksrv:9200"
#elasticsearch.username: "elastic"
#elasticsearch.password: "changeme"
# x-park
#xpack.security.enabled: false
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

## Monitor

kbn状态页 `http://elksrv:5601/status`