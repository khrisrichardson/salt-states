# ceilometer-agent-notification

## Description:

Ceilometer aims to deliver a unique point of contact for billing systems to aquire all counters they need to establish  customer billing, accross all current and future OpenStack components. The delivery of counters must be tracable and auditable, the counters must be easily extensible to support new projects, and agents doing data collections should be independent of the overall system.

(A ceilometer is an instrument that measures cloud coverage.)

This package contains the notification agent.

## Depends:

  -  [ceilometer-common](/salt/ceilometer-common)
  -  [sensu-client](/salt/sensu-client)
  -  [supervisor](/salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [sensu-api](/salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── etc
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-ceilometer-agent-notification.json
│   └── supervisor
│       └── conf.d
│           └── ceilometer-agent-notification.conf
├── init.sls
└── relate-sensu-api.sls

5 directories, 5 files
```
