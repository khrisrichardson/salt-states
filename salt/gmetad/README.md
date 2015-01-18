# gmetad

## Description:

Ganglia is a scalable, real-time cluster monitoring environment that collects cluster statistics in an open and well-defined XML format.

This package contains the 'gmetad' daemon, which collects information from ganglia monitor clients and writes it to RRD databases.

## Depends:

  -  [sensu-client](/salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── defaults.yaml
├── etc
│   ├── ganglia
│   │   └── gmetad.conf
│   └── sensu
│       └── conf.d
│           └── checks-gmetad.json
├── init.sls
├── map.jinja
└── relate-sensu-api.sls
```
