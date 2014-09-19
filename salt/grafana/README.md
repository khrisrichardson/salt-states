# grafana

## Description:



## Depends:

  -  [nginx](/salt/nginx)
  -  [sensu-client](/salt/sensu-client)
  -  [tar](/salt/tar)
  -  [wget](/salt/wget)

## Reverse Depends:

  -  N/A

## Relates:

  -  [elasticsearch](/salt/elasticsearch)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-nginx.sls
├── Dockerfile
├── etc
│   ├── nginx
│   │   └── sites-available
│   │       └── grafana
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-grafana.json
│   └── systemd
│       └── system
│           └── grafana.service
├── init.sls
├── relate-elasticsearch.sls
├── relate-influxdb.sls
├── relate-sensu-api.sls
└── usr
    └── share
        └── grafana
            ├── app
            │   ├── app.js
            │   └── dashboards
            │       ├── default.json
            │       └── template.json
            └── config.js

13 directories, 14 files
```
