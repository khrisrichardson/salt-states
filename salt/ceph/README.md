# ceph

## Depends:

  -  [bash](/salt/bash)
  -  [logstash](/salt/logstash)
  -  [openssh-server](/salt/openssh-server)
  -  [sudo](/salt/sudo)
  -  [uuid-runtime](/salt/uuid-runtime)

## Reverse Depends:

  -  [radosgw](/salt/radosgw)
  -  [radosgw-agent](/salt/radosgw-agent)

## Relates:

  -  [ceph-deploy](/salt/ceph-deploy)
  -  [ceph-mds](/salt/ceph-mds)
  -  [ceph-mon](/salt/ceph-mon)
  -  [ceph-osd](/salt/ceph-osd)
  -  [etcd](/salt/etcd)
  -  [logstash](/salt/logstash)
  -  [radosgw](/salt/radosgw)

## Files:

```bash
.
├── depend-openssh.sls
├── depend-sudo.sls
├── etc
│   ├── ceph
│   │   └── ceph.conf
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-ceph.conf
│   └── sudoers.d
│       └── ceph
├── init.sls
├── relate-ceph-deploy.sls
├── relate-ceph-mds.sls
├── relate-ceph-mon.sls
├── relate-ceph-osd.sls
├── relate-etcd.sls
├── relate-logstash.sls
└── relate-radosgw.sls
```
