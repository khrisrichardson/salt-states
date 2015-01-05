# openstack-dashboard

## Description:

The OpenStack Dashboard is a reference implementation of a Django site that uses the Django-Nova project to provide web based interactions with the OpenStack Nova cloud controller.

## Depends:

  -  [apache2](/salt/apache2)
  -  [haproxy](/salt/haproxy)
  -  [postfix](/salt/postfix)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [keystone](/salt/keystone)
  -  [memcached](/salt/memcached)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-apache2.sls
├── depend-haproxy.sls
├── etc
│   ├── apache2
│   │   └── sites-available
│   │       └── openstack-dashboard
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── openstack-dashboard
│   │   └── local_settings.py
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-openstack-dashboard.json
│   └── systemd
│       └── system
│           └── openstack-dashboard.service
├── init.sls
├── relate-keystone.sls
├── relate-memcached.sls
└── relate-sensu-api.sls
```
