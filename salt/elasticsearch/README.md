# elasticsearch

## Description:

Open Source, Distributed, RESTful Search Engine

## Depends:

  -  [debianutils](/salt/debianutils)
  -  [elasticsearch-graphite](/salt/elasticsearch-graphite)
  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [python-apt](/salt/python-apt)
  -  [ruby-rest-client](/salt/ruby-rest-client)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [graph-explorer](/salt/graph-explorer)

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── elasticsearch
│   │   └── elasticsearch.yml
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-elasticsearch.json
│   └── systemd
│       └── system
│           └── elasticsearch.service
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── elasticsearch.xml
├── relate-elasticsearch.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls

10 directories, 11 files
```
