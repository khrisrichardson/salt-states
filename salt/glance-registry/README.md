# glance-registry

## Description:

The Glance project provides an image registration, discovery and delivery service. These services may be used as stand-along services, and they may also be used by Nova to deliver images from object stores, such as OpenStack's Swift service, to Nova's compute nodes.

This package contains the glance registry server.

## Depends:

  -  [haproxy] (salt/haproxy)
  -  [logstash] (salt/logstash)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [keystone] (salt/keystone)
  -  [logstash] (salt/logstash)
  -  [mariadb-server] (salt/mariadb-server)
  -  [memcached] (salt/memcached)
  -  [mysql-server] (salt/mysql-server)
  -  [postgresql] (salt/postgresql)
  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-haproxy.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── glance
│   │   ├── glance-registry.conf
│   │   └── glance-registry-paste.ini
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-glance-registry.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-glance-registry.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── glance-registry.conf
│   └── systemd
│       └── system
│           └── glance-registry.service
├── init.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-postgresql.sls
└── relate-sensu-api.sls

12 directories, 19 files
```
