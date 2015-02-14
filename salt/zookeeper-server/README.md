# zookeeper-server

## Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)
  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [sensu-client](/salt/sensu-client)
  -  [zookeeper](/salt/zookeeper)

## Reverse Depends:

  -  [mesos](/salt/mesos)
  -  [zookeeperd](/salt/zookeeperd)

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
│           └── checks-zookeeper-server.json
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── zookeeper-server.xml
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
