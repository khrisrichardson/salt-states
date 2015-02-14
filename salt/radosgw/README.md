# radosgw

## Depends:

  -  [apache2](/salt/apache2)
  -  [ceph](/salt/ceph)
  -  [haproxy](/salt/haproxy)
  -  [libapache2-mod-fastcgi](/salt/libapache2-mod-fastcgi)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceph-mon](/salt/ceph-mon)
  -  [logstash](/salt/logstash)
  -  [radosgw](/salt/radosgw)
  -  [salt-master](/salt/salt-master)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-apache2.sls
├── depend-haproxy.sls
├── depend-libapache2-mod-fastcgi.sls
├── etc
│   ├── apache2
│   │   └── sites-available
│   │       └── radosgw
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-radosgw.conf
│   └── sensu
│       └── conf.d
│           └── checks-radosgw.json
├── init.sls
├── map.jinja
├── relate-ceph-mon.sls
├── relate-logstash.sls
├── relate-radosgw.sls
├── relate-salt-master.sls
├── relate-sensu-api.sls
└── var
    └── www
        └── s3gw.fcgi
```
