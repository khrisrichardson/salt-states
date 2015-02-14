# hadoop

## Depends:

  -  [cloudera-cdh4](/salt/cloudera-cdh4)
  -  [cloudera-cdh5](/salt/cloudera-cdh5)

## Reverse Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)

## Relates:

  -  [ganglia](/salt/ganglia)
  -  [hadoop-hdfs-namenode](/salt/hadoop-hdfs-namenode)
  -  [hadoop-hdfs-secondarynamenode](/salt/hadoop-hdfs-secondarynamenode)
  -  [logstash](/salt/logstash)

## Files:

```bash
.
├── etc
│   ├── hadoop
│   │   └── conf.empty
│   │       ├── core-site.xml
│   │       ├── hadoop-metrics.properties
│   │       ├── log4j.properties
│   │       ├── masters
│   │       └── slaves
│   └── logstash
│       └── conf.d
│           └── input-file-hadoop.conf
├── init.sls
├── relate-ganglia.sls
├── relate-hadoop-hdfs-namenode.sls
├── relate-hadoop-hdfs-secondarynamenode.sls
└── relate-logstash.sls
```
