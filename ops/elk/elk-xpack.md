# x-pack

## install

- elasticsearch

```bash
./elasticsearch-5.5.1/bin/elasticsearch-plugin install file:///data/elk/x-pack-5.5.1.zip 
```

- kibana

```bash
./kibana-5.5.1-linux-x86_64/bin/kibana-plugin install file:///data/elk/x-pack-5.5.1.zip
```

## auth

modify password
```bash
# elastic
curl -XPUT -u elastic 'vm153:9200/_xpack/security/user/elastic/_password' -d '{
  "password" : "123456"
}'

# kibana
curl -XPUT -u elastic 'vm153:9200/_xpack/security/user/kibana/_password' -d '{
  "password" : "123456"
}'
```