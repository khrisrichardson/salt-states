# radosgw-agent

## Description:

RADOS is a distributed object store used by the Ceph distributed storage system.  This package provides a REST gateway to the object store that aims to implement a superset of Amazon's S3 service.

This package contains the agent for synchronization between geographically separated RADOS deployments.

## Depends:

  -  [ceph](/salt/ceph)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](/salt/logstash)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-radosgw-agent.conf
│   └── sensu
│       └── conf.d
│           └── checks-radosgw-agent.json
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

5 directories, 5 files
```
