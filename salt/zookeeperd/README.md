# zookeeperd

## Description:

ZooKeeper is a centralized, reliable, service for maintaining configuration information, naming, providing distributed synchronization, and group services. All of these kinds of services are used in some form or another by distributed applications.

This package contains init.d scripts to start and stop zookeeper and starts zookeeper on installation.

## Depends:

  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [sensu-client](/salt/sensu-client)
  -  [zookeeper-server](/salt/zookeeper-server)

## Reverse Depends:

  -  N/A

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-zookeeperd.json
│   └── systemd
│       └── system
│           └── zookeeperd.service
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── zookeeperd.xml
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls

9 directories, 9 files
```
