# apache2

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [calamari](/salt/calamari)
  -  [cobbler-web](/salt/cobbler-web)
  -  [descartes](/salt/descartes)
  -  [dusk](/salt/dusk)
  -  [graphite-web](/salt/graphite-web)
  -  [nagios3](/salt/nagios3)
  -  [openstack-dashboard](/salt/openstack-dashboard)
  -  [opsview](/salt/opsview)
  -  [radosgw](/salt/radosgw)
  -  [tasseo](/salt/tasseo)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-apache2.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
