# cloudera-cm5-agent

## Description:

The Cloudera Manager Agent.

The Agent is deployed to machines running services managed by Cloudera Manager.

## Depends:

  -  [cloudera-cm5](/salt/cloudera-cm5)
  -  [cloudera-cm5-api](/salt/cloudera-cm5-api)
  -  [e2fsprogs](/salt/e2fsprogs)
  -  [hadoop-hdfs.depend-e2fsprogs](/salt/hadoop-hdfs/depend-e2fsprogs.sls)
  -  [hadoop-hdfs.depend-mount](/salt/hadoop-hdfs/depend-mount.sls)
  -  [hadoop-hdfs.depend-parted](/salt/hadoop-hdfs/depend-parted.sls)
  -  [oracle-j2sdk1\_7](/salt/oracle-j2sdk1_7)
  -  [oracle-java7-installer](/salt/oracle-java7-installer)
  -  [parted](/salt/parted)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cloudera-cm5-server](/salt/cloudera-cm5-server)
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

  -  [cloudera-cm5-server](/salt/cloudera-cm5-server)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-e2fsprogs.sls
├── depend-mount.sls
├── depend-parted.sls
├── etc
│   ├── cloudera-scm-agent
│   │   └── config.ini
│   └── sensu
│       └── conf.d
│           └── checks-cloudera-cm5-agent.json
├── init.sls
├── relate-cloudera-cm5-server.sls
├── relate-sensu-api.sls
└── root
    └── bin
        ├── cm_client.ini
        └── cm_client.py

6 directories, 10 files
```
