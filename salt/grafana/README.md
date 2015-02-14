# grafana

## Depends:

  -  [nginx](/salt/nginx)
  -  [sensu-client](/salt/sensu-client)
  -  [tar](/salt/tar)
  -  [wget](/salt/wget)

## Reverse Depends:

  -  N/A

## Relates:

  -  [elasticsearch](/salt/elasticsearch)
  -  [graphite-carbon](/salt/graphite-carbon)
  -  [graphite-web](/salt/graphite-web)
  -  [influxdb](/salt/influxdb)
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-nginx.sls
├── etc
│   ├── nginx
│   │   └── sites-available
│   │       └── grafana
│   └── sensu
│       └── conf.d
│           └── checks-grafana.json
├── init.sls
├── relate-elasticsearch.sls
├── relate-graphite-carbon.sls
├── relate-graphite-web.sls
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
```
