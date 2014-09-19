# cinder-common

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

Cinder is the OpenStack Block storage service.

This package contains commons components for Cinder.

## Depends:

  -  [sudo] (salt/sudo)

## Reverse Depends:

  -  [cinder-api] (salt/cinder-api)
  -  [cinder-backup] (salt/cinder-backup)
  -  [cinder-scheduler] (salt/cinder-scheduler)
  -  [cinder-volume] (salt/cinder-volume)

## Relates:

  -  [ceph-osd] (salt/ceph-osd)
  -  [glance-api] (salt/glance-api)
  -  [keystone] (salt/keystone)
  -  [mariadb-server] (salt/mariadb-server)
  -  [memcached] (salt/memcached)
  -  [mysql-server] (salt/mysql-server)
  -  [postgresql] (salt/postgresql)
  -  [qpidd] (salt/qpidd)
  -  [rabbitmq-server] (salt/rabbitmq-server)
  -  [radosgw] (salt/radosgw)
  -  [redis-server] (salt/redis-server)
  -  [swift-proxy] (salt/swift-proxy)
  -  [tivoli-storage-manager] (salt/tivoli-storage-manager)

## Files:

```bash
.
├── depend-sudo.sls
├── etc
│   └── cinder
│       ├── api-paste.ini
│       ├── cinder.conf
│       ├── logging.conf
│       ├── policy.json
│       └── rootwrap.conf
├── init.sls
├── relate-ceph-osd.sls
├── relate-glance-api.sls
├── relate-keystone.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
├── relate-radosgw.sls
├── relate-redis-server.sls
├── relate-swift-proxy.sls
└── relate-tivoli-storage-manager.sls

2 directories, 20 files
```
