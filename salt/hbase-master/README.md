# hbase-master

## Description:

HMaster is the "master server" for a HBase. There is only one HMaster for a
single HBase deployment.

## Depends:

  -  [base-files](salt/base-files)
  -  [cloudera-cm4-agent](salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](salt/cloudera-cm5-agent)
  -  [hbase](salt/hbase)
  -  [jmxtrans-agent](salt/jmxtrans-agent)
  -  [netbase](salt/netbase)
  -  [oracle-j2sdk1\_7](salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](salt/oracle-java7-installer)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cloudera-cm4-server](salt/cloudera-cm4-server)
  -  [cloudera-cm5-server](salt/cloudera-cm5-server)
  -  [graphite-carbon](salt/graphite-carbon)
  -  [hbase-regionserver](salt/hbase-regionserver)
  -  [influxdb](salt/influxdb)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-hbase-master.json
│   └── systemd
│       └── system
│           └── hbase-master.service
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── hbase-master.xml
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-graphite-carbon.sls
├── relate-hbase-regionserver.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls

9 directories, 12 files
```
