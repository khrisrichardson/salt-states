# ceph

## Description:

Ceph is a distributed storage system designed to provide excellent performance, reliability, and scalability.

This package contains all server daemons and management tools for creating, running, and administering a Ceph storage cluster, with the exception of the metadata server, which is necessary for using the distributed file system and is provided by the ceph-mds package.

## Depends:

  -  [bash](/salt/bash)
  -  [ceph-common](/salt/ceph-common)
  -  [logstash](/salt/logstash)
  -  [openssh-server](/salt/openssh-server)
  -  [sudo](/salt/sudo)
  -  [uuid-runtime](/salt/uuid-runtime)

## Reverse Depends:

  -  [radosgw](/salt/radosgw)
  -  [radosgw-agent](/salt/radosgw-agent)

## Relates:

  -  [etcd](/salt/etcd)
  -  [logstash](/salt/logstash)

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
├── relate-etcd.sls
└── relate-logstash.sls
```
