# X-Pack

- [Install](#install)
- [Auth](#auth)
- [License](#license)
- [Module](#module)
- [REF](#ref)

## Install

- elasticsearch

```bash
./elasticsearch-5.5.1/bin/elasticsearch-plugin install file:///data/elk/x-pack-5.5.1.zip 
```

- logstash
```bash
./logstash-5.5.1/bin/logstash-plugin install file:///data/elk/x-pack-5.5.1.zip
```

- kibana

```bash
./kibana-5.5.1-linux-x86_64/bin/kibana-plugin install file:///data/elk/x-pack-5.5.1.zip
```



## Auth

- modify password
```bash
# elastic
curl -XPUT -u elastic 'elksrv.es:9200/_xpack/security/user/elastic/_password' -d '{
  "password" : "123456"
}'

# kibana
curl -XPUT -u elastic 'elksrv.es:9200/_xpack/security/user/kibana/_password' -d '{
  "password" : "123456"
}'
```

## License

```bash
# curl -XPUT -u elastic 'http://<host>:<port>/_xpack/license' -H "Content-Type: application/json" -d @license.json
curl -XPUT -u elastic 'http://localhost:9200/_xpack/license' -H "Content-Type: application/json" -d @license.json
curl -XPUT -u elastic 'http://elksrv.es:9200/_xpack/license?acknowledge=true' -H "Content-Type: application/json" -d @license.json
# license status
http://elksrv.es:9200/_xpack/license
```

## Module

### Monitoring

formerly Marvel

### Management


### Alerting

via Watcher

### Security

formerly Shield

### Dev Tools

- Search Profiler
- Grok Debugger


## REF

- [x-pack-guide](https://www.elastic.co/guide/en/x-pack/5.5/index.html)
- [subscriptions-license](https://www.elastic.co/subscriptions)
- [installing-license](https://www.elastic.co/guide/en/x-pack/current/installing-license.html)
- [xpack-alerting](https://www.elastic.co/guide/en/x-pack/current/xpack-alerting.html#xpack-alerting)