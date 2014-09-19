# zookeeper

## Description:

ZooKeeper is a centralized, reliable, service for maintaining configuration information, naming, providing distributed synchronization, and group services. All of these kinds of services are used in some form or another by distributed applications.

This package contains the shell scripts and an example configuration but does not automatically start up the service. The example configuration is installed with the update-alternatives mechanism.

## Depends:

  -  [cloudera-cdh4] (salt/cloudera-cdh4)
  -  [cloudera-cdh5] (salt/cloudera-cdh5)

## Reverse Depends:

  -  [mesos] (salt/mesos)

## Relates:

  -  N/A

## Files:

```bash
.
├── etc
│   └── zookeeper
│       └── conf.dist
│           └── log4j.properties
└── init.sls

3 directories, 2 files
```
