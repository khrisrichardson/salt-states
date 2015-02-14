# postfix

## Depends:

  -  [debconf-utils](/salt/debconf-utils)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [docker-registry](/salt/docker-registry)
  -  [gitlab](/salt/gitlab)
  -  [graphite-web](/salt/graphite-web)
  -  [nagios3](/salt/nagios3)
  -  [openstack-dashboard](/salt/openstack-dashboard)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── postfix
│   │   └── main.cf
│   └── sensu
│       └── conf.d
│           └── checks-postfix.json
├── init.sls
├── map.jinja
├── pkg.selections
└── relate-sensu-api.sls
```
