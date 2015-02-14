# ironic-common

## Depends:

  -  [sudo](/salt/sudo)

## Reverse Depends:

  -  [ironic-api](/salt/ironic-api)
  -  [ironic-conductor](/salt/ironic-conductor)

## Relates:

  -  [glance-api](/salt/glance-api)
  -  [keystone](/salt/keystone)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [neutron-server](/salt/neutron-server)
  -  [postgresql](/salt/postgresql)
  -  [qpidd](/salt/qpidd)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)

## Files:

```bash
.
├── depend-sudo.sls
├── etc
│   └── ironic
│       ├── ironic.conf
│       ├── policy.json
│       ├── rootwrap.conf
│       └── rootwrap.d
│           ├── ironic-images.filters
│           ├── ironic-manage-ipmi.filters
│           └── ironic-utils.filters
├── init.sls
├── relate-glance-api.sls
├── relate-keystone.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-neutron-server.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
└── relate-redis-server.sls
```
