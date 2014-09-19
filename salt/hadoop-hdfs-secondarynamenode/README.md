# hadoop-hdfs-secondarynamenode

## Description:

The Secondary Name Node periodically compacts the Name Node EditLog into a
checkpoint. This compaction ensures that Name Node restarts do not incur
unnecessary downtime.

## Depends:

  -  [cloudera-cm4-agent](salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](salt/cloudera-cm5-agent)
  -  [hadoop-hdfs](salt/hadoop-hdfs)
  -  [jmxtrans-agent](salt/jmxtrans-agent)
  -  [oracle-j2sdk1\_7](salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](salt/oracle-java7-installer)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cloudera-cm4-server](salt/cloudera-cm4-server)
  -  [cloudera-cm5-server](salt/cloudera-cm5-server)
  -  [graphite-carbon](salt/graphite-carbon)
  -  [hadoop-hdfs-namenode](salt/hadoop-hdfs-namenode)
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
│   │       └── checks-hadoop-hdfs-secondarynamenode.json
│   └── systemd
│       └── system
│           └── hadoop-hdfs-secondarynamenode.service
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── hadoop-hdfs-secondarynamenode.xml
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-graphite-carbon.sls
├── relate-hadoop-hdfs-namenode.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls

9 directories, 12 files
```
