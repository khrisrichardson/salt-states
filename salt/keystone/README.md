# keystone

## Description:

Keystone is a proposed independent authentication service for OpenStack.

This initial proof of concept aims to address the current use cases in Swift and Nova which are:

* REST-based, token auth for Swift
* many-to-many relationship between identity and tenant for Nova. Keystone
  does authentication and stuff
This package contains the daemons.

## Depends:

  -  [haproxy](/salt/haproxy)
  -  [logstash](/salt/logstash)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceilometer-api](/salt/ceilometer-api)
  -  [cinder-api](/salt/cinder-api)
  -  [glance-api](/salt/glance-api)
  -  [heat-api](/salt/heat-api)
  -  [ironic-api](/salt/ironic-api)
  -  [logstash](/salt/logstash)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [neutron-server](/salt/neutron-server)
  -  [nova-api-ec2](/salt/nova-api-ec2)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [nova-api](/salt/nova-api)
  -  [postgresql](/salt/postgresql)
  -  [qpidd](/salt/qpidd)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)
  -  [sensu-api](/salt/sensu-api)
  -  [swift-proxy](/salt/swift-proxy)

## Files:

```bash
.
├── defaults.yaml
├── depend-haproxy.sls
├── depend-supervisor.sls
├── etc
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── keystone
│   │   ├── default_catalog.templates
│   │   ├── keystone.conf
│   │   ├── keystone-paste.ini
│   │   ├── logging.conf
│   │   └── policy.json
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-keystone.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-keystone.json
│   └── supervisor
│       └── conf.d
│           └── keystone.conf
├── init.sls
├── relate-ceilometer-api.sls
├── relate-cinder-api.sls
├── relate-glance-api.sls
├── relate-heat-api.sls
├── relate-ironic-api.sls
├── relate-keystone.sls
├── relate-logstash.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-neutron-server.sls
├── relate-nova-api-ec2.sls
├── relate-nova-api-metadata.sls
├── relate-nova-api.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
├── relate-redis-server.sls
├── relate-sensu-api.sls
├── relate-swift-proxy.sls
└── root
    ├── .bash_profile
    └── bin
        └── keystone.sh
```
