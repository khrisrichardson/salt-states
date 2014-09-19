# influxdb

## Description:

InfluxDB is a time series, events, and metrics database. It’s written in Go and
has no external dependencies. That means once you install it there’s nothing
else to manage (like Redis, HBase, or whatever). It’s designed to be
distributed and scale horizontally, but be useful even if you’re only running
it on a single box.

## Depends:

  -  [sensu-client](/salt/sensu-client)
  -  [sudo](/salt/sudo)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── Dockerfile
├── etc
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-influxdb.json
│   └── systemd
│       └── system
│           └── influxdb.service
├── init.sls
├── opt
│   └── influxdb
│       └── shared
│           └── config.toml
└── relate-sensu-api.sls

9 directories, 7 files
```
