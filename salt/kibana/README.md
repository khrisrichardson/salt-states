# kibana

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
  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── depend-nginx.sls
├── etc
│   ├── nginx
│   │   └── sites-available
│   │       └── kibana
│   └── sensu
│       └── conf.d
│           └── checks-kibana.json
├── init.sls
├── relate-elasticsearch.sls
├── relate-sensu-api.sls
└── usr
    └── share
        └── kibana
            ├── app
            │   └── dashboards
            │       └── default.json
            └── config.js
```
