# ceilometer-api

## Description:

Ceilometer aims to deliver a unique point of contact for billing systems to aquire all counters they need to establish  customer billing, accross all current and future OpenStack components. The delivery of counters must be tracable and auditable, the counters must be easily extensible to support new projects, and agents doing data collections should be independent of the overall system.

This package contains the api service

## Depends:

  -  [ceilometer-common] (salt/ceilometer-common)
  -  [haproxy] (salt/haproxy)
  -  [sensu-client] (salt/sensu-client)
  -  [supervisor] (salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api] (salt/sensu-api)

## Files:

```bash
.
├── depend-haproxy.sls
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── haproxy
│   │   └── haproxy.cfg
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ceilometer-api.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── ceilometer-api.conf
│   └── systemd
│       └── system
│           └── ceilometer-api.service
├── init.sls
└── relate-sensu-api.sls

9 directories, 10 files
```
