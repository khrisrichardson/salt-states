# kafka

## Depends:

  -  [git](/salt/git)
  -  [sbt](/salt/sbt)
  -  [supervisor](/salt/supervisor)
  -  [tar](/salt/tar)
  -  [wget](/salt/wget)

## Reverse Depends:

  -  N/A

## Relates:

  -  [zookeeper-server](/salt/zookeeper-server)

## Files:

```bash
.
├── depend-git.sls
├── depend-sbt.sls
├── depend-supervisor.sls
├── etc
│   └── supervisor
│       └── conf.d
│           └── kafka.conf
├── init.sls
├── relate-zookeeper-server.sls
└── usr
    └── share
        └── kafka
            └── config
                ├── log4j.properties
                └── server.properties
```
