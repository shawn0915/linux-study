# Welcome to heartbeat 5.5.1

Ping remote services for availability and log results to Elasticsearch or send to Logstash.

## Getting Started

To get started with heartbeat, you need to set up Elasticsearch on your localhost first. After that, start heartbeat with:

     ./heartbeat  -c heartbeat.yml -e

This will start the beat and send the data to your Elasticsearch instance. To load the dashboards for heartbeat into Kibana, run:

    ./scripts/import_dashboards

For further steps visit the [Getting started](https://www.elastic.co/guide/en/beats/heartbeat/5.5/heartbeat-getting-started.html) guide.

## Documentation

Visit [Elastic.co Docs](https://www.elastic.co/guide/en/beats/heartbeat/5.5/index.html) for the full heartbeat documentation.

## Release notes

https://www.elastic.co/guide/en/beats/libbeat/5.5/release-notes-5.5.1.html
