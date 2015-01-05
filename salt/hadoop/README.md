# hadoop

## Description:

Hadoop is a software platform that lets one easily write and run applications
that process vast amounts of data.

Here's what makes Hadoop especially useful:

 * Scalable:   Hadoop can reliably store and process petabytes.
 * Economical: It distributes the data and processing across clusters of
               commonly available computers. These clusters can number into the
               thousands of nodes.
 * Efficient:  By distributing the data, Hadoop can process it in parallel on
               the nodes where the data is located. This makes it extremely
               rapid.
 * Reliable:   Hadoop automatically maintains multiple copies of data and
               automatically redeploys computing tasks based on failures.

Hadoop implements MapReduce, using the Hadoop Distributed File System (HDFS).
MapReduce divides applications into many small blocks of work. HDFS creates
multiple replicas of data blocks for reliability, placing them on compute nodes
around the cluster. MapReduce can then process the data where it is located.

## Depends:

  -  [cloudera-cdh4](/salt/cloudera-cdh4)
  -  [cloudera-cdh5](/salt/cloudera-cdh5)

## Reverse Depends:

  -  [cloudera-cm4-agent](/salt/cloudera-cm4-agent)
  -  [cloudera-cm5-agent](/salt/cloudera-cm5-agent)

## Relates:

  -  [ganglia](/salt/ganglia)
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
