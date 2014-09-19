# cloudera-cm4-agent

## Description:

The Cloudera Manager Agent.

The Agent is deployed to machines running services managed by Cloudera Manager.

## Depends:

  -  [cloudera-cm4](/salt/cloudera-cm4)
  -  [cloudera-cm4-api](/salt/cloudera-cm4-api)
  -  [hadoop-hdfs.depend-e2fsprogs](/salt/hadoop-hdfs/depend-e2fsprogs.sls)
  -  [hadoop-hdfs.depend-mount](/salt/hadoop-hdfs/depend-mount.sls)
  -  [hadoop-hdfs.depend-parted](/salt/hadoop-hdfs/depend-parted.sls)
  -  [oracle-j2sdk1\_6](/salt/oracle-j2sdk1_6)
  -  [oracle-java6-installer](/salt/oracle-java6-installer)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cloudera-cm4-server](/salt/cloudera-cm4-server)
  -  [hadoop-hdfs-datanode](/salt/hadoop-hdfs-datanode)
  -  [hadoop-hdfs-journalnode](/salt/hadoop-hdfs-journalnode)
  -  [hadoop-hdfs-namenode](/salt/hadoop-hdfs-namenode)
  -  [hadoop-hdfs-secondarynamenode](/salt/hadoop-hdfs-secondarynamenode)
  -  [hbase-master](/salt/hbase-master)
  -  [hbase-regionserver](/salt/hbase-regionserver)
  -  [oozie](/salt/oozie)
  -  [solr](/salt/solr)
  -  [zookeeper-server](/salt/zookeeper-server)

## Relates:

  -  [cloudera-cm4-server](/salt/cloudera-cm4-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── cloudera-scm-agent
│   │   └── config.ini
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm4-agent.json
├── init.sls
├── relate-cloudera-cm4-server.sls
├── relate-sensu-api.sls
└── root
    └── bin
        ├── cm_client.ini
        └── cm_client.py

6 directories, 7 files
```
