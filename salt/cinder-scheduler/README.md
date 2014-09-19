# cinder-scheduler

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

Cinder is the OpenStack Block storage service.

This package contains the Cinder Scheduler server.

## Depends:

  -  [cinder-common](salt/cinder-common)
  -  [logstash](salt/logstash)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](salt/logstash)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-supervisor.sls
├── Dockerfile
├── etc
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-cinder-scheduler.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cinder-scheduler.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── cinder-scheduler.conf
│   └── systemd
│       └── system
│           └── cinder-scheduler.service
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

10 directories, 10 files
```
