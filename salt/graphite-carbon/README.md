# graphite-carbon

## Description:

Graphite is a web application using the Twisted framework to provide real-time visualization and storage of numeric time-series data.

The Carbon daemon processes the incoming time-series data and saves it as Whisper database files.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  [graphite-web](/salt/graphite-web)

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   └── sensu
│       └── conf.d
│           └── checks-graphite-carbon.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
