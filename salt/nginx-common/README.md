# nginx-common

## Description:

Nginx ("engine X") is a high-performance web and reverse proxy server created by Igor Sysoev. It can be used both as a standalone web server and as a proxy to reduce the load on back-end HTTP or mail servers.

This package contains base configuration files used by all versions of nginx.

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
│   │   └── nginx-common.conf
│   ├── nginx
│   │   ├── fastcgi_params
│   │   └── nginx.conf
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-nginx-common.json
│   └── systemd
│       └── system
│           └── nginx-common.service
├── init.sls
├── relate-graphite-carbon.sls
├── relate-influxdb.sls
└── relate-sensu-api.sls
```
