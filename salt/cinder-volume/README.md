# cinder-volume

## Description:

OpenStack is a reliable cloud infrastructure. Its mission is to produce the ubiquitous cloud computing platform that will meet the needs of public and private cloud providers regardless of size, by being simple to implement and massively scalable.

Cinder is the OpenStack Block storage service.

This package contains the Cinder Volume server.

## Depends:

  -  [cinder-common](salt/cinder-common)
  -  [iscsitarget](salt/iscsitarget)
  -  [logstash](salt/logstash)
  -  [lvm2](salt/lvm2)
  -  [sensu-client](salt/sensu-client)
  -  [supervisor](salt/supervisor)
  -  [tgt](salt/tgt)

## Reverse Depends:

  -  N/A

## Relates:

  -  [logstash](salt/logstash)
  -  [sensu-api](salt/sensu-api)

## Files:

```bash
.
├── depend-iscsitarget.sls
├── depend-supervisor.sls
├── depend-tgt.sls
├── Dockerfile
├── etc
│   ├── cinder
│   │   └── rootwrap.d
│   │       └── volume.filters
│   ├── logstash
│   │   └── conf.d
│   │       └── input-file-cinder-volume.conf
│   ├── salt
│   │   └── grains
│   ├── sensu
│   │   └── conf.d
│   │       └── checks-cinder-volume.json
│   ├── supervisor
│   │   └── conf.d
│   │       └── cinder-volume.conf
│   ├── systemd
│   │   └── system
│   │       └── cinder-volume.service
│   └── tgt
│       └── conf.d
│           └── cinder_tgt.conf
├── init.sls
├── relate-logstash.sls
└── relate-sensu-api.sls

14 directories, 14 files
```
