# hadoop-hdfs-datanode

## Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)
  -  [hadoop-hdfs](/salt/hadoop-hdfs)
  -  [jmxtrans-agent](/salt/jmxtrans-agent)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [cloudera-cm4-server](/salt/cloudera-cm4-server)
  -  [cloudera-cm5-server](/salt/cloudera-cm5-server)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [hadoop-hdfs-namenode](/salt/hadoop-hdfs-namenode)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-hadoop-hdfs-datanode.json
├── init.sls
├── opt
│   └── jmxtrans
│       └── etc
│           └── hadoop-hdfs-datanode.xml
├── relate-cloudera-cm4-server.sls
├── relate-cloudera-cm5-server.sls
├── relate-graphite-carbon.sls
├── relate-hadoop-hdfs-namenode.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
