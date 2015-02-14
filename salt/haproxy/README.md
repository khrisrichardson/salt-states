# haproxy

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [ceilometer-api](/salt/ceilometer-api)
  -  [cinder-api](/salt/cinder-api)
  -  [glance-api](/salt/glance-api)
  -  [glance-registry](/salt/glance-registry)
  -  [keystone](/salt/keystone)
  -  [neutron-lbaas-agent](/salt/neutron-lbaas-agent)
  -  [nova-api](/salt/nova-api)
  -  [nova-api-ec2](/salt/nova-api-ec2)
  -  [nova-api-metadata](/salt/nova-api-metadata)
  -  [nova-spiceproxy](/salt/nova-spiceproxy)
  -  [openstack-dashboard](/salt/openstack-dashboard)
  -  [radosgw](/salt/radosgw)
  -  [swift-proxy](/salt/swift-proxy)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── default
│   │   └── haproxy
│   └── sensu
│       └── conf.d
│           └── checks-haproxy.json
├── init.sls
└── relate-sensu-api.sls
```
