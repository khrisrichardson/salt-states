# hbase

## Depends:

  -  [cloudera-cdh4](/salt/cloudera-cdh4)
  -  [cloudera-cdh5](/salt/cloudera-cdh5)
  -  [cron](/salt/cron)

## Reverse Depends:

  -  N/A

## Relates:

  -  [hadoop-hdfs-namenode](/salt/hadoop-hdfs-namenode)
  -  [hbase-master](/salt/hbase-master)
  -  [hbase-regionserver](/salt/hbase-regionserver)
  -  [logstash](/salt/logstash)
  -  [zookeeper-server](/salt/zookeeper-server)

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
```
