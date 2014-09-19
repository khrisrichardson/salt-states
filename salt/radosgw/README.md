# radosgw

## Description:

RADOS is a distributed object store used by the Ceph distributed storage system.  This package provides a REST gateway to the object store that aims to implement a superset of Amazon's S3 service.

This package contains the proxy daemon and related tools only.

## Depends:

  -  [apache2](salt/apache2)
  -  [ceph](salt/ceph)
  -  [haproxy](salt/haproxy)
  -  [libapache2-mod-fastcgi](salt/libapache2-mod-fastcgi)
  -  [logstash](salt/logstash)
  -  [sensu-client](salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-mon](salt/ceph-mon)
  -  [logstash](salt/logstash)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-apache2.sls
├── depend-haproxy.sls
├── depend-libapache2-mod-fastcgi.sls
├── Dockerfile
├── etc
│   ├── apache2
│   │   └── sites-available
│   │       └── radosgw
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-radosgw.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-radosgw.json
│   └── systemd
│       └── system
│           └── radosgw.service
├── init.sls
├── relate-ceph-mon.sls
├── relate-logstash.sls
├── relate-radosgw.sls
├── relate-sensu-api.sls
└── var
    └── www
        └── s3gw.fcgi

13 directories, 16 files
```
