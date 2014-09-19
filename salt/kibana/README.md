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
├── depend-nginx.sls
├── Dockerfile
├── etc
│   ├── nginx
│   │   └── sites-available
│   │       └── kibana
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-kibana.json
│   └── systemd
│       └── system
│           └── kibana.service
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

13 directories, 11 files
```
