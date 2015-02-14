# ceph-deploy

## Depends:

  -  [ceph](/salt/ceph)
  -  [ceph.depend-openssh](/salt/ceph/depend-openssh.sls)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-mds](/salt/ceph-mds)
  -  [ceph-mon](/salt/ceph-mon)
  -  [ceph-osd](/salt/ceph-osd)
  -  [radosgw](/salt/radosgw)
  -  [salt-master](/salt/salt-master)

## Files:

```bash
.
├── defaults.yaml
├── depend-openssh.sls
├── home
│   └── ceph
│       └── .ssh
│           └── config
├── init.sls
├── relate-ceph-mds.sls
├── relate-ceph-mon.sls
├── relate-ceph-osd.sls
├── relate-radosgw.sls
└── relate-salt-master.sls
```
