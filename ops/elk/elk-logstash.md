# Logstash

## Config

- config/startup.options

```yaml
LS_HOME=/data/elk/logstash-5.5.1

LS_USER=elk
LS_GROUP=elk
```

- config/logstash.yml

```yaml
http.host: "0.0.0.0"
```

## REF

- [How Logstash Works](https://www.elastic.co/guide/en/logstash/current/pipeline.html)
