# nova-common

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

OpenStack Compute, codenamed Nova, is a cloud computing fabric controller. In addition to its "native" API (the OpenStack API), it also supports the Amazon EC2 API.

Nova is intended to be modular and easy to extend and adapt. It supports many different hypervisors (KVM and Xen to name a few), different database backends (SQLite, MySQL, and PostgreSQL, for instance), different types of user databases (LDAP or SQL), etc.

This package contains things that are needed by all parts of Nova.

## Depends:

  -  [logstash](/salt/logstash)
  -  [netbase](/salt/netbase)
  -  [sudo](/salt/sudo)

## Reverse Depends:

  -  [nova-api](/salt/nova-api)
  -  [nova-api-ec2](/salt/nova-api-ec2)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [nova-api-os-compute](/salt/nova-api-os-compute)
  -  [nova-baremetal](/salt/nova-baremetal)
  -  [nova-cells](/salt/nova-cells)
  -  [nova-cert](/salt/nova-cert)
  -  [nova-compute](/salt/nova-compute)
  -  [nova-conductor](/salt/nova-conductor)
  -  [nova-console](/salt/nova-console)
  -  [nova-consoleauth](/salt/nova-consoleauth)
  -  [nova-network](/salt/nova-network)
  -  [nova-novncproxy](/salt/nova-novncproxy)
  -  [nova-objectstore](/salt/nova-objectstore)
  -  [nova-scheduler](/salt/nova-scheduler)
  -  [nova-spiceproxy](/salt/nova-spiceproxy)
  -  [nova-xvpvncproxy](/salt/nova-xvpvncproxy)

## Relates:

  -  [glance-api](/salt/glance-api)
  -  [keystone](/salt/keystone)
  -  [logstash](/salt/logstash)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [neutron-server](/salt/neutron-server)
  -  [nova-novncproxy](/salt/nova-novncproxy)
  -  [nova-spiceproxy](/salt/nova-spiceproxy)
  -  [nova-xvpvncproxy](/salt/nova-xvpvncproxy)
  -  [postgresql](/salt/postgresql)
  -  [qpidd](/salt/qpidd)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)

## Files:

```bash
.
├── depend-sudo.sls
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-nova-common.conf
│   ├── nova
│   │   ├── api-paste.ini
│   │   ├── logging.conf
│   │   ├── nova.conf
│   │   ├── policy.json
│   │   └── rootwrap.conf
│   └── sudoers.d
│       └── nova_sudoers
├── init.sls
├── relate-glance-api.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-neutron-server.sls
├── relate-nova-novncproxy.sls
├── relate-nova-spiceproxy.sls
├── relate-nova-xvpvncproxy.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
└── relate-redis-server.sls

5 directories, 23 files
```
