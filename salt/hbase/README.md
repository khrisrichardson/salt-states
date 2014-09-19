# hbase

## Description:

HBase is an open-source, distributed, column-oriented store modeled after
Google's Bigtable: A Distributed Storage System for Structured Data by Chang et
al. Just as Bigtable leverages the distributed data storage provided by the
Google File System, HBase provides Bigtable-like capabilities on top of Hadoop.

HBase includes:

 * Convenient base classes for backing Hadoop MapReduce jobs with HBase tables
 * Query predicate push down via server side scan and get filters
 * Optimizations for real time queries
 * A high performance Thrift gateway
 * A REST-ful Web service gateway that supports XML, Protobuf, and binary data
   encoding options
 * Cascading source and sink modules
 * Extensible jruby-based (JIRB) shell
 * Support for exporting metrics via the Hadoop metrics subsystem to files or
   Ganglia; or via JMX

## Depends:

  -  [cloudera-cdh4] (salt/cloudera-cdh4)
  -  [cloudera-cdh5] (salt/cloudera-cdh5)
  -  [cron] (salt/cron)

## Reverse Depends:

  -  N/A

## Relates:

  -  [hadoop-hdfs-namenode] (salt/hadoop-hdfs-namenode)
  -  [logstash] (salt/logstash)
  -  [zookeeper-server] (salt/zookeeper-server)

## Files:

```bash
.
├── depend-cron.sls
├── etc
│   ├── hbase
│   │   └── conf.dist
│   │       ├── hbase-env.sh
│   │       ├── hbase-site.xml
│   │       └── regionservers
│   └── logstash
│       └── conf.d
│           └── input-file-hbase.conf
├── init.sls
├── relate-hadoop-hdfs-namenode.sls
├── relate-hbase-master.sls
├── relate-hbase-regionserver.sls
├── relate-logstash.sls
├── relate-zookeeper-server.sls
└── usr
    └── lib
        └── hbase
            └── bin
                └── snapshot.rb

9 directories, 12 files
```
