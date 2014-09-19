# ceph-mon

## Description:



## Depends:

  -  [ceph](salt/ceph)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-deploy](salt/ceph-deploy)
  -  [etcd](salt/etcd)
  -  [radosgw](salt/radosgw)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ceph-mon.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── ceph-mon.conf
│   └── systemd
│       └── system
│           └── ceph-mon.service
├── init.sls
├── relate-ceph-deploy.sls
├── relate-ceph-mon.sls
├── relate-etcd.sls
├── relate-radosgw.sls
└── relate-sensu-api.sls

8 directories, 12 files
```
