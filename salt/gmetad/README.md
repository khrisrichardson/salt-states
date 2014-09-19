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
├── Dockerfile
├── etc
│   ├── ganglia
│   │   └── gmetad.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-gmetad.json
│   └── systemd
│       └── system
│           └── gmetad.service
├── init.sls
└── relate-sensu-api.sls

7 directories, 7 files
```
