# zookeeper

## Depends:

  -  [cloudera-cdh4](/salt/cloudera-cdh4)
  -  [cloudera-cdh5](/salt/cloudera-cdh5)

## Reverse Depends:

  -  [mesos](/salt/mesos)
  -  [zookeeperd](/salt/zookeeperd)

## Relates:

  -  [rsyslog](/salt/rsyslog)

## Files:

```bash
.
├── etc
│   └── zookeeper
│       └── conf.dist
│           └── log4j.properties
├── init.sls
└── relate-rsyslog.sls
```
