# ironic-common

## Description:

Ironic is an Incubated OpenStack project which aims to provision bare metal machines instead of virtual machines, forked from the Nova Baremetal driver. It is best thought of as a bare metal hypervisor **API** and a set of plugins which interact with the bare metal hypervisors. By default, it will use PXE and IPMI in concert to provision and turn on/off machines, but Ironic also supports vendor-specific plugins which may implement additional functionality.

This package contains the common files.

## Depends:

  -  [sudo](salt/sudo)

## Reverse Depends:

  -  [ironic-api](salt/ironic-api)
  -  [ironic-conductor](salt/ironic-conductor)

## Relates:

  -  [glance-api](salt/glance-api)
  -  [keystone](salt/keystone)
  -  [mariadb-server](salt/mariadb-server)
  -  [memcached](salt/memcached)
  -  [mysql-server](salt/mysql-server)
  -  [neutron-server](salt/neutron-server)
  -  [postgresql](salt/postgresql)
  -  [qpidd](salt/qpidd)
  -  [rabbitmq-server](salt/rabbitmq-server)
  -  [redis-server](salt/redis-server)

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

3 directories, 18 files
```
