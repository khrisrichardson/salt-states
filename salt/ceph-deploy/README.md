# ceph-deploy

## Description:

Ceph-deploy is an easy to use deployment and configuration tool for the Ceph distributed storage system.

This package includes the programs and libraries to support simple ceph cluster deployment.

## Depends:

  -  [ceph](/salt/ceph)
  -  [ceph.depend-openssh](/salt/ceph.depend-openssh)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-mds](/salt/ceph-mds)
  -  [ceph-mon](/salt/ceph-mon)
  -  [ceph-osd](/salt/ceph-osd)

## Files:

```bash
.
├── defaults.yaml
├── depend-openssh.sls
├── etc
│   └── systemd
│       └── system
│           └── ceph-deploy.service
├── home
│   └── ceph
├── init.sls
├── relate-ceph-mds.sls
├── relate-ceph-mon.sls
└── relate-ceph-osd.sls
```
