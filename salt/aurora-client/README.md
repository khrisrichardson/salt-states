# aurora-client

## Depends:

  -  [aurora](/salt/aurora)
  -  [aurora.depend-git](/salt/aurora\/depend-git)
  -  [curl](/salt/curl)
  -  [openjdk-7-jdk](/salt/openjdk-7-jdk)
  -  [python-dev](/salt/python-dev)

## Reverse Depends:

  -  N/A

## Relates:

  -  [aurora-scheduler](/salt/aurora-scheduler)
  -  [zookeeper-server](/salt/zookeeper-server)

## Files:

```bash
.
├── depend-git.sls
├── etc
│   └── aurora
│       └── clusters.json
├── init.sls
├── relate-aurora-scheduler.sls
└── relate-zookeeper-server.sls
```
