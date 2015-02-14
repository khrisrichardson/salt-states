# zookeeperd

## Depends:

  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [sensu-client](/salt/sensu-client)
  -  [zookeeper-server](/salt/zookeeper-server)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cloudera-cm4-server](/salt/cloudera-cm4-server)
  -  [cloudera-cm5-server](/salt/cloudera-cm5-server)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-zookeeperd.json
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── zookeeperd.xml
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
