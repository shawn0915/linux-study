# ElasticSearch

- [config](#config)
- [port](#port)
- [command](#command)
- [rest](#rest)
- [plugin](#plugin)
- [ref](#ref)
- [BookList](#booklist)

## config

- config/elasticsearch.yml

```yaml
#grep ^[^#] elasticsearch.yml
#
cluster.name: ceb
node.name: node
path.data: /data/es
path.logs: /data/logs/es
network.host: 0.0.0.0
# cluster
discovery.zen.ping.unicast.hosts: ["vm153:9300"]
discovery.zen.minimum_master_nodes: 1
# x-pack
xpack.security.enabled: true
xpack.monitoring.enabled: true
xpack.graph.enabled: true
xpack.watcher.enabled: true
#
# 以下内容暂未添加
# 用户认证模式，ldap、file、pki、ActiveDirectory等
xpack.security.authc.realms:
    file1:
      type: file
      order: 0
```

- config/jvm.options

```yaml
# grep ^[^#] jvm.options 
#
-Xms512m
-Xmx512m
```

- /etc/security/limits.conf

```
* hard memlock unlimited
* soft memlock unlimited
* hard nofile 65536
* soft nofile 65536
*  - as unlimited
```

- /etc/sysctl.conf

```
fs.file-max = 2097152
vm.max_map_count = 262144
vm.swappiness = 1
```

Ps.reboot

## port

listen 9200/9300

## command

```bash
# start
./bin/elasticsearch -d
./bin/elasticsearch -d -p /path/elasticsearch.pid -Des.logger.level=DEBUG
# shutdown

```

## rest

```bash
# pretty
curl -XGET http://vm153:9200
curl -XGET http://vm153:9200/?pretty
## filebeat
http://vm153:9200/filebeat-*/_search?pretty
## template
http://vm153:9200/_template/filebeat?pretty
## x-park
http://vm153:9200/_xpack?pretty
## cluster
http://vm153:9200/_cluster/state/nodes
#
# auth
curl -XGET http://vm153:9200/?auth_user=elastic&auth_password=changeme
curl -XGET --user elastic:changeme http://vm153:9200/_cluster/health?pretty
#
# search
http://vm153:9200/_search
#
# monitor
## index
http://vm153:9200/_cat/indices?v
## nodes
http://vm153:9200/_cat/nodes?v
```

# plugin

- [elasticsearch-head](https://github.com/mobz/elasticsearch-head)
- [IK-Analyzer](http://code.csdn.net/openkb/p-IK%20Analyzer)

## ref

- [lucene](http://lucene.apache.org/)
- [github-es](https://github.com/elastic/elasticsearch)
- [elastic-es](https://www.elastic.co/products/elasticsearch)
- [download-es-1-7-5](https://www.elastic.co/downloads/past-releases/elasticsearch-1-7-5)
- [download-es-5-5-1](https://www.elastic.co/downloads/past-releases/elasticsearch-5-5-1)
- [elastic中文社区](https://elasticsearch.cn/)
- [ElasticSearch 简单入门](http://www.oschina.net/translate/elasticsearch-getting-started?cmp)


## BookList

- 《Elasticsearch服务器开发》
- [Elasticsearch 权威指南（中文版）](https://es.xiaoleilu.com/)