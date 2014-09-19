# hadoop-hdfs

## Description:

Hadoop Distributed File System (HDFS) is the primary storage system used by
Hadoop applications. HDFS creates multiple replicas of data blocks and
distributes them on cluster hosts to enable reliable and extremely rapid
computations.

## Depends:

  -  [e2fsprogs](/salt/e2fsprogs)
  -  [hadoop](/salt/hadoop)
  -  [parted](/salt/parted)

## Reverse Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)

## Relates:

  -  [hadoop-hdfs-namenode](/salt/hadoop-hdfs-namenode)

## Files:

```bash
.
├── depend-e2fsprogs.sls
├── depend-mount.sls
├── depend-parted.sls
├── etc
│   └── hadoop
│       └── conf.empty
│           └── hdfs-site.xml
├── init.sls
└── relate-hadoop-hdfs-namenode.sls

3 directories, 6 files
```
