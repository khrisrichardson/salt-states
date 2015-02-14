# ceilometer-common

## Depends:

  -  N/A

## Reverse Depends:

  -  [ceilometer-agent-central](/salt/ceilometer-agent-central)
  -  [ceilometer-agent-compute](/salt/ceilometer-agent-compute)
  -  [ceilometer-agent-notification](/salt/ceilometer-agent-notification)
  -  [ceilometer-alarm-evaluator](/salt/ceilometer-alarm-evaluator)
  -  [ceilometer-alarm-notifier](/salt/ceilometer-alarm-notifier)
  -  [ceilometer-api](/salt/ceilometer-api)
  -  [ceilometer-collector](/salt/ceilometer-collector)

## Relates:

  -  [keystone](/salt/keystone)
  -  [mariadb-server](/salt/mariadb-server)
  -  [memcached](/salt/memcached)
  -  [mysql-server](/salt/mysql-server)
  -  [nova-compute-docker](/salt/nova-compute-docker)
  -  [nova-compute-kvm](/salt/nova-compute-kvm)
  -  [nova-compute-lxc](/salt/nova-compute-lxc)
  -  [nova-compute-qemu](/salt/nova-compute-qemu)
  -  [nova-compute-xen](/salt/nova-compute-xen)
  -  [postgresql](/salt/postgresql)
  -  [qpidd](/salt/qpidd)
  -  [rabbitmq-server](/salt/rabbitmq-server)
  -  [redis-server](/salt/redis-server)

## Files:

```bash
.
├── etc
│   └── ceilometer
│       ├── ceilometer.conf
│       ├── pipeline.yaml
│       ├── policy.json
│       └── sources.json
├── init.sls
├── relate-keystone.sls
├── relate-mariadb-server.sls
├── relate-memcached.sls
├── relate-mysql-server.sls
├── relate-nova-compute-docker.sls
├── relate-nova-compute-kvm.sls
├── relate-nova-compute-lxc.sls
├── relate-nova-compute-qemu.sls
├── relate-nova-compute-xen.sls
├── relate-postgresql.sls
├── relate-qpidd.sls
├── relate-rabbitmq-server.sls
└── relate-redis-server.sls
```
