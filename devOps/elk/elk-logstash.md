# Logstash

## Install

```bash
tar zxvf logstash-5.5.1.tar.gz -C ~/app
```

## Start

- Hello World
```bash
./bin/logstash -e ''
./bin/logstash -e 'input{stdin{}}output{stdout{codec=>rubydebug}}'
```
output:
```
{
    "@timestamp" => 2017-10-13T02:52:39.854Z,
      "@version" => "1",
          "host" => "localhost.localdomain",
       "message" => "hello world"
}
```

- "-f"

```bash
./bin/logstash -f logstash-apache-beats.conf
nohup ./bin/logstash -f logstash-apache-beats.conf &
```

## config examples

- [logstash-apache](conf/logstash-apache.conf)
- [logstash-apache-beats](conf/logstash-apache-beats.conf)



## grok

- tool: grokdebug

```
https://raw.githubusercontent.com/logstash-plugins/logstash-patterns-core/master/patterns/grok-patterns

https://github.com/logstash-plugins/logstash-patterns-core/blob/master/patterns/grok-patterns

http://grokdebug.herokuapp.com/
```

## REF

- [How Logstash Works](https://www.elastic.co/guide/en/logstash/current/pipeline.html)
- [life-of-a-logstash-event](https://speakerdeck.com/elastic/life-of-a-logstash-event)
- [getting-started](https://www.elastic.co/guide/en/logstash/current/getting-started-with-logstash.html)
- [config-examples](https://www.elastic.co/guide/en/logstash/current/config-examples.html)
- [logstash-patterns-httpd](https://github.com/logstash-plugins/logstash-patterns-core/blob/master/patterns/httpd)
- [logstash-config-for-filebeat-modules](https://www.elastic.co/guide/en/logstash/5.6/logstash-config-for-filebeat-modules.html)