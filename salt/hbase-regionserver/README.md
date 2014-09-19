# hbase-regionserver

## Description:

HRegionServer makes a set of HRegions available to clients. It checks in with
the HMaster. There are many HRegionServers in a single HBase deployment.

## Depends:

  -  [cloudera-cm4-agent] (salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent] (salt/cloudera-cm5-agent)
  -  [hbase] (salt/hbase)
  -  [jmxtrans-agent] (salt/jmxtrans-agent)
  -  [oracle-j2sdk1\_7] (salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer] (salt/oracle-java7-installer)
  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cloudera-cm4-server] (salt/cloudera-cm4-server)
  -  [cloudera-cm5-server] (salt/cloudera-cm5-server)
  -  [graphite-carbon] (salt/graphite-carbon)
  -  [influxdb] (salt/influxdb)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-hbase-regionserver.json
│   └── systemd
│       └── system
│           └── hbase-regionserver.service
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── hbase-regionserver.xml
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls

9 directories, 11 files
```
