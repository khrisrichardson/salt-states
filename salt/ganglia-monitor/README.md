# ganglia-monitor

## Description:

Ganglia is a scalable, real-time cluster monitoring environment that collects cluster statistics in an open and well-defined XML format.

This package contains the monitor core program.

## Depends:

  -  [sensu-client] (salt/sensu-client)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ganglia-monitor.json
│   └── systemd
│       └── system
│           └── ganglia-monitor.service
├── init.sls
└── relate-sensu-api.sls

6 directories, 6 files
```
