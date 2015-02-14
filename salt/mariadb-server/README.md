# mariadb-server

## Depends:

  -  [debconf-utils](/salt/debconf-utils)
  -  [mysql-common](/salt/mysql-common)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [ceilometer-api](/salt/ceilometer-api)
  -  [cinder-api](/salt/cinder-api)
  -  [glance-api](/salt/glance-api)
  -  [glance-registry](/salt/glance-registry)
  -  [heat-api](/salt/heat-api)
  -  [ironic-api](/salt/ironic-api)
  -  [keystone](/salt/keystone)
  -  [neutron-server](/salt/neutron-server)
  -  [nova-api](/salt/nova-api)
  -  [nova-baremetal](/salt/nova-baremetal)
  -  [salt-minion](/salt/salt-minion)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-mariadb-server.json
├── init.sls
├── map.jinja
├── relate-ceilometer-api.sls
├── relate-cinder-api.sls
├── relate-glance-api.sls
├── relate-glance-registry.sls
├── relate-heat-api.sls
├── relate-ironic-api.sls
├── relate-keystone.sls
├── relate-neutron-server.sls
├── relate-nova-api.sls
├── relate-nova-baremetal.sls
├── relate-salt-minion.sls
└── relate-sensu-api.sls
```
