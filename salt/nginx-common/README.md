# nginx-common

## Depends:

  -  [collectd](/salt/collectd)
  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [cobbler](/salt/cobbler)
  -  [coreos-ipxe-server](/salt/coreos-ipxe-server)
  -  [nginx](/salt/nginx)

## Relates:

  -  [graphite-carbon](/salt/graphite-carbon)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── collectd.d
│   │   └── input-nginx-common.conf
│   ├── nginx
│   │   ├── fastcgi_params
│   │   └── nginx.conf
│   └── sensu
│       └── conf.d
│           └── checks-nginx-common.json
├── init.sls
├── map.jinja
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
