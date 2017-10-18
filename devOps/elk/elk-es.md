# ElasticSearch

- [Install](#install)
- [Config](#config)
- [port](#port)
- [Command](#command)
- [api](#api)
- [Plugin](#plugin)
- [REF](#ref)
- [Book List](#booklist)

## Install

```bash
tar zxvf elasticsearch-5.5.1.tar.gz -C ~/app
```

## Config

- config/elasticsearch.yml

```yaml
#grep ^[^#] elasticsearch.yml
#
cluster.name: elk
node.name: node-1
path.data: /elk/data/es
path.logs: /elk/logs/es
network.host: 0.0.0.0
# cluster
discovery.zen.ping.unicast.hosts: ["elksrv.es:9300"]
discovery.zen.minimum_master_nodes: 1
#
# x-pack base
# xpack.monitoring.enabled: true
# x-park gold
#xpack.security.enabled: true
## 用户认证模式，ldap、file、pki、ActiveDirectory等
#xpack.security.authc.realms:
#    file1:
#      type: file
#      order: 0
#xpack.watcher.enabled: true
# x-park platinum
#xpack.graph.enabled: true
```

- config/jvm.options

```yaml
# grep ^[^#] jvm.options 
#
-Xms512m
-Xmx512m
```


## port

listen `9200/9300`

## Command

```bash
# start
./bin/elasticsearch -d
./bin/elasticsearch -d -p /path/elasticsearch.pid -Des.logger.level=DEBUG
# shutdown
kill
# users
./bin/x-pack/users list
```

## api

- pretty
```bash
# pretty
curl -XGET http://elksrv.es:9200
http://elksrv.es:9200/?pretty
## cluster
http://elksrv.es:9200/_cluster/state/nodes
http://elksrv.es:9200/_cluster/health?pretty
## node
http://elksrv.es:9200/_nodes/stats
## filebeat
http://elksrv.es:9200/filebeat-*/_search?pretty
## x-park
http://elksrv.es:9200/_xpack?pretty
## template
http://elksrv.es:9200/_template/filebeat?pretty
```

- auth
```bash
# auth
curl -XGET http://elksrv.es:9200/?auth_user=elastic&auth_password=changeme
curl -XGET --user elastic:changeme http://elksrv.es:9200/_cluster/health?pretty
```

- search
```bash
# search
http://elksrv.es:9200/_search
```

- cat
```bash
# index
http://elksrv.es:9200/_cat/indices?v
# nodes
http://elksrv.es:9200/_cat/nodes?v
# others
/_cat/nodes
/_cat/shards
/_cat/shards/{index}
/_cat/aliases
/_cat/aliases/{alias}
/_cat/tasks
/_cat/master
/_cat/plugins
/_cat/fielddata
/_cat/fielddata/{fields}
/_cat/pending_tasks
/_cat/count
/_cat/count/{index}
/_cat/snapshots/{repository}
/_cat/recovery
/_cat/recovery/{index}
/_cat/segments
/_cat/segments/{index}
/_cat/thread_pool
/_cat/thread_pool/{thread_pools}/_cat/nodeattrs
/_cat/allocation
/_cat/repositories
/_cat/health
/_cat/indices
/_cat/indices/{index}
```

- monitor
```bash
# hot_threads
# 该节点消耗资源最多的前三个线程的堆栈情况
http://elksrv.es:9200/_nodes/_local/hot_threads?interval=1s
```

- load template

beat采集的数据会传送到LS，无需再载入模板。
```bash
# filebeat
curl -XPUT --user elastic:changeme 'http://elksrv.es:9200/_template/filebeat?pretty' -d@/data/elk/filebeat-5.5.1-linux-x86_64/filebeat.template.json
# metricbeat
curl -XPUT --user elastic:changeme 'http://elksrv.es:9200/_template/metricbeat?pretty' -d @metricbeat.template.json
# heartbeat
curl -XPUT --user elastic:changeme 'http://elksrv.es:9200/_template/heartbeat?pretty' -d @heartbeat.template.json
```
返回`{"acknowledged":true}`则表示成功。

delete template
```bash
curl -XDELETE 'http://elksrv.es:9200/filebeat-*'
```

# Plugin

- [~~elasticsearch-head~~](https://github.com/mobz/elasticsearch-head)
- [IK-Analyzer](http://code.csdn.net/openkb/p-IK%20Analyzer)

## REF

> common

- [github-es](https://github.com/elastic/elasticsearch)
- [elastic-es](https://www.elastic.co/products/elasticsearch)
- [ref-es](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)

> other

- [Lucene](http://lucene.apache.org/)
- [~~download-es-1-7-5~~](https://www.elastic.co/downloads/past-releases/elasticsearch-1-7-5)
- [download-es-5-5-1](https://www.elastic.co/downloads/past-releases/elasticsearch-5-5-1)
- [elastic中文社区](https://elasticsearch.cn/)
- [ElasticSearch 简单入门](http://www.oschina.net/translate/elasticsearch-getting-started?cmp)


## BookList

- 《Elasticsearch服务器开发》
- [《Elasticsearch 权威指南（中文版）》](https://es.xiaoleilu.com/)