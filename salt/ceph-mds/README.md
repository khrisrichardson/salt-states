# ceph-mds

## Description:

Ceph is a distributed storage and network file system designed to provide excellent performance, reliability, and scalability.

This package contains the metadata server daemon, which is used to create a distributed file system on top of the ceph storage cluster.

## Depends:

  -  [ceph](/salt/ceph)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-deploy](/salt/ceph-deploy)
  -  [ceph-mon](/salt/ceph-mon)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ceph-mds.json
│   └── systemd
│       └── system
│           └── ceph-mds.service
├── init.sls
├── relate-ceph-deploy.sls
├── relate-ceph-mon.sls
└── relate-sensu-api.sls

6 directories, 8 files
```
