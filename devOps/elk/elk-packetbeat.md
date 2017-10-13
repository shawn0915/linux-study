# Packetbeat

## dependency

```bash
yum install -y libpcap
```

## packetbeat-dashboards

- Install
```bash
git clone https://github.com/elastic/packetbeat-dashboards
cd packetbeat-dashboards
./load.sh -url http://vm153:9200 -user elastic:changeme
```

- dashboard

knb => dashboard => Packetbeat Dashboard